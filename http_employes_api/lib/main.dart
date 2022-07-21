// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

void main() => runApp(const MyApp());

class Employee {
  String id;
  String employeeName;
  String employeeSalary;
  String employeeAge;
  String profileImage;

  Employee(this.id, this.employeeName, this.employeeSalary, this.employeeAge,
      this.profileImage);

  Employee.empty()
      : id = "",
        employeeName = "",
        employeeSalary = "",
        employeeAge = "",
        profileImage = "";

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
        json['id'].toString(),
        json['employee_name'],
        json['employee_salary'].toString(),
        json['employee_age'].toString(),
        json['profile_image']);
  }

  Map<String, dynamic> toJson() {
    var map = {
      'name': employeeName,
      'salary': employeeSalary,
      'age': employeeAge
    };
    if (id.isNotEmpty) {
      map['id'] = id;
    }
    if (profileImage.isNotEmpty) {
      map['profileImage'] = profileImage;
    }
    return map;
  }

  get hasEmptyId {
    return id.isEmpty;
  }
}

class PleaseWaitWidget extends StatelessWidget {
  const PleaseWaitWidget({
    Key? key,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white.withOpacity(0.8),
        child: const Center(
          child: CircularProgressIndicator(),
        ));
  }
}

class ApiWidget extends InheritedWidget {
  static const String baseUrl = "https://cka.collectiva.in/api";

  static const _TIMEOUT = Duration(seconds: 15);

  const ApiWidget({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  static ApiWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ApiWidget>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  Future<List<Employee>> loadAndParseEmployees() async {
    var url = '$baseUrl/employees';
    final response = await http.get(Uri.parse(url)).timeout(_TIMEOUT);
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      var list = parsed["data"]
          .map<Employee>((json) => Employee.fromJson(json))
          .toList();
      return list;
    } else {
      badStatusCode(response);
      throw '';
    }
  }

  Future<Employee> loadEmployee(String id) async {
    var url = '$baseUrl/employees/get/$id';
    final response = await http.get(Uri.parse(url)).timeout(_TIMEOUT);
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      return Employee.fromJson(parsed["data"]);
    } else {
      badStatusCode(response);
      throw Exception(
          'Bad status code ${response.statusCode} returned from server.');
    }
  }

  Future<dynamic> saveEmployee(Employee employee) async {
    bool isUpdate = employee.id.isNotEmpty;
    final uri = baseUrl +
        (isUpdate ? '/employees/update/${employee.id}' : '/employees/create');
    // profile image does not seem to update
    final response = isUpdate
        ? await http.put(Uri.parse(uri),
            body: json.encode(employee),
            headers: {"content-type": "application/json"}).timeout(_TIMEOUT)
        : await http
            .post(Uri.parse(uri), body: json.encode(employee))
            .timeout(_TIMEOUT);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      // If that response was not OK, throw an error.
      badStatusCode(response);
      throw Exception(
          'Bad status code ${response.statusCode} returned from server.');
    }
  }

  Future<dynamic> deleteEmployee(String id) async {
    final uri = '$baseUrl/employees/delete/$id';
    final response = await http.delete(Uri.parse(uri)).timeout(_TIMEOUT);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      // If that response was not OK, throw an error.
      badStatusCode(response);
      throw Exception(
          'Bad status code ${response.statusCode} returned from server.');
    }
  }

  badStatusCode(Response response) {
    debugPrint("Bad status code ${response.statusCode} returned from server.");
    debugPrint("Response body ${response.body} returned from server.");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ApiWidget(
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const EmployeeListWidget()));
  }
}

class EmployeeListWidget extends StatefulWidget {
  const EmployeeListWidget({Key? key}) : super(key: key);

  @override
  _EmployeeListWidgetState createState() => _EmployeeListWidgetState();
}

class _EmployeeListWidgetState extends State<EmployeeListWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final PleaseWaitWidget _pleaseWaitWidget =
      const PleaseWaitWidget(key: ObjectKey("pleaseWaitWidget"));

  bool _refresh = true;
  late List<Employee> _employees;
  bool _pleaseWait = false;

  _showSnackBar(String content, {bool error = false}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('${error ? "An unexpected error occurred: " : ""}$content'),
    ));
  }

  _showPleaseWait(bool b) {
    setState(() {
      _pleaseWait = b;
    });
  }

  _navigateToEmployee(BuildContext context, String employeeId) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EmployeeDetailWidget(employeeId)),
    ).then((result) {
      if ((result != null) && (result is bool) && (result == true)) {
        _showSnackBar('Employee saved.');
        _refreshEmployees();
      }
    });
  }

  _deleteEmployee(BuildContext context, Employee employee) async {
    _showDeleteConfirmDialog(employee).then((result) {
      if ((result != null) && (result is bool) && (result == true)) {
        _showPleaseWait(true);
        try {
          ApiWidget.of(context)?.deleteEmployee(employee.id).then((employee) {
            _showPleaseWait(false);
            _showSnackBar('Employee deleted.');
            _refreshEmployees();
          }).catchError((error) {
            _showPleaseWait(false);
            _showSnackBar(error.toString(), error: true);
          });
        } catch (e) {
          _showPleaseWait(false);
          _showSnackBar(e.toString(), error: true);
        }
      }
    });
  }

  Future<bool?> _showDeleteConfirmDialog(Employee employee) async {
    return await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Delete Employee'),
            content: Text(
                'Are you sure you want to delete ${employee.employeeName}?'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text('Yes'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: const Text('No'),
              )
            ],
          );
        });
  }

  _refreshEmployees() {
    setState(() {
      _refresh = true;
    });
  }

  _loadEmployees(BuildContext context) {
    _showPleaseWait(true);
    try {
      ApiWidget.of(context)?.loadAndParseEmployees().then((employees) {
        // Sort first.
        employees.sort((a, b) => a.employeeName
            .toLowerCase()
            .compareTo(b.employeeName.toLowerCase()));
        setState(() {
          _employees = employees;
        });
        _showPleaseWait(false);
      }).catchError((error) {
        _showPleaseWait(false);
        _showSnackBar(error.toString(), error: true);
      });
    } catch (e) {
      _showPleaseWait(false);
      _showSnackBar(e.toString(), error: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_refresh) {
      _refresh = false;
      _loadEmployees(context);
    }

    ListView builder = ListView.builder(
        itemCount: _employees.length,
        itemBuilder: (context, index) {
          Employee employee = _employees[index];
          return ListTile(
              title: Text(employee.employeeName),
              subtitle: Text('Age: ${employee.employeeAge}'),
              trailing: const Icon(Icons.arrow_right),
              onTap: () => _navigateToEmployee(context, employee.id),
              onLongPress: () => _deleteEmployee(context, employee));
        });

    Widget bodyWidget = _pleaseWait
        ? Stack(
            key: const ObjectKey("stack"),
            children: [_pleaseWaitWidget, builder])
        : Stack(key: const ObjectKey("stack"), children: [builder]);

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text("Employees"),
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.add),
                tooltip: 'Add',
                onPressed: () {
                  _navigateToEmployee(context, '');
                }),
            IconButton(
                icon: const Icon(Icons.refresh),
                tooltip: 'Refresh',
                onPressed: () {
                  _refreshEmployees();
                })
          ],
        ),
        body: Center(
          child: bodyWidget,
        ));
  }
}

class EmployeeDetailWidget extends StatefulWidget {
  final String _employeeId;

  const EmployeeDetailWidget(this._employeeId);
  @override
  _EmployeeDetailState createState() => _EmployeeDetailState(_employeeId);
}

class _EmployeeDetailState extends State<EmployeeDetailWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final PleaseWaitWidget _pleaseWaitWidget =
      const PleaseWaitWidget(key: ObjectKey("pleaseWaitWidget"));

  final String _employeeId;
  bool _loaded = false;
  bool _pleaseWait = false;
  late Employee _employee;
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _salaryTextController = TextEditingController();
  final TextEditingController _ageTextController = TextEditingController();
  final TextEditingController _profileImageTextController =
      TextEditingController();

  _EmployeeDetailState(this._employeeId);

  _showSnackBar(String content, {bool error = false}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('${error ? "An unexpected error occurred: " : ""}$content'),
    ));
  }

  _showPleaseWait(bool b) {
    setState(() {
      _pleaseWait = b;
    });
  }

  TextFormField _createNameWidget() {
    return TextFormField(
      validator: (value) {
        if (value == null) {
          return 'Please enter the name.';
        }
        return null;
      },
      decoration: const InputDecoration(
          icon: Icon(Icons.person),
          hintText: 'Name',
          labelText: 'Enter the name'),
      onSaved: (String? value) {
        _employee.employeeName = value ?? '';
      },
      controller: _nameTextController,
      autofocus: true,
    );
  }

  TextFormField _createSalaryWidget() {
    return TextFormField(
      validator: (value) {
        if (value == null) {
          return 'Please enter the salary.';
        }
        int salary = int.parse(value);
        if (salary == 0) {
          return 'Please enter the salary as a number.';
        }
        if ((salary < 10000) || (salary > 500000)) {
          return 'Please enter an age between 10000 and 50000.';
        }
        return null;
      },
      maxLength: 6,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      keyboardType: TextInputType.phone,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: const InputDecoration(
          icon: Icon(Icons.person),
          hintText: 'Salary',
          labelText: 'Enter the salary'),
      onSaved: (String? value) {
        _employee.employeeSalary = value ?? '';
      },
      controller: _salaryTextController,
    );
  }

  TextFormField _createAgeWidget() {
    return TextFormField(
      validator: (value) {
        if (value == null) {
          return 'Please enter the age.';
        }
        int age = int.parse(value);
        if (age == 0) {
          return 'Please enter the age as a number.';
        }
        if ((age < 1) || (age > 114)) {
          return 'Please enter an age between 1 and 114.';
        }
        return null;
      },
      maxLength: 3,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      keyboardType: TextInputType.phone,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: const InputDecoration(
          icon: Icon(Icons.person),
          hintText: 'Age',
          labelText: 'Enter the age'),
      onSaved: (String? value) {
        _employee.employeeAge = value ?? '';
      },
      controller: _ageTextController,
    );
  }

  TextFormField _createProfileImageWidget() {
    return TextFormField(
      decoration: const InputDecoration(
          icon: Icon(Icons.person),
          hintText: 'Profile image',
          labelText: 'Enter the profile image'),
      onSaved: (String? value) {
        _employee.profileImage = value ?? '';
      },
      controller: _profileImageTextController,
    );
  }

  _loadEmployee(BuildContext context) {
    _showPleaseWait(true);
    try {
      ApiWidget.of(context)?.loadEmployee(_employeeId).then((employee) {
        setState(() {
          _employee = employee;
          _nameTextController.text = employee.employeeName;
          _salaryTextController.text = employee.employeeSalary;
          _ageTextController.text = employee.employeeAge;
          _profileImageTextController.text = employee.profileImage;
        });
        _showPleaseWait(false);
      }).catchError((error) {
        _showPleaseWait(false);
        _showSnackBar(error.toString(), error: true);
      });
    } catch (e) {
      _showPleaseWait(false);
      _showSnackBar(e.toString(), error: true);
    }
  }

  _saveEmployee(BuildContext context) {
    _showPleaseWait(true);
    try {
      ApiWidget.of(context)?.saveEmployee(_employee).then((employee) {
        _showPleaseWait(false);
        Navigator.pop(context, true);
      }).catchError((error) {
        _showPleaseWait(false);
        _showSnackBar(error.toString(), error: true);
      });
    } catch (e) {
      _showPleaseWait(false);
      _showSnackBar(e.toString(), error: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_loaded) {
      _loaded = true;
      if (_employeeId.length == 0) {
        _employee = Employee.empty();
      } else {
        _loadEmployee(context);
      }
    }

    List<Widget> formWidgetList = [
      _createNameWidget(),
      _createSalaryWidget(),
      _createAgeWidget(),
      _createProfileImageWidget(),
      ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            _saveEmployee(context);
          }
        },
        child: const Text('Save'),
      )
    ];
    Form form = Form(key: _formKey, child: ListView(children: formWidgetList));

    Widget bodyWidget = _pleaseWait
        ? Stack(
            key: const ObjectKey("stack"), children: [_pleaseWaitWidget, form])
        : Stack(key: const ObjectKey("stack"), children: [form]);

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Row(children: [
            const Text("Back"),
            const Spacer(),
            Text(_employeeId.length == 0 ? "Create Employee" : "Edit Employee")
          ]),
        ),
        body: Padding(padding: const EdgeInsets.all(20.0), child: bodyWidget));
  }
}
