// ignore_for_file: library_private_types_in_public_api, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

void main() => runApp(const MyApp());

class PersonInfo {
  String _fname = "";
  String _lname = "";
  String _sex = "m";
  String _addr1 = "";
  String _addr2 = "";
  String _city = "";
  String _state = "";
  String _zip = "";
  bool _fiveYears = false;
  DateTime? _dob;

  PersonInfo(this._fname, this._lname, this._sex, this._addr1, this._addr2,
      this._city, this._state, this._zip, this._fiveYears, this._dob);

  PersonInfo.empty();

  String get fname => _fname;
  String get lname => _lname;
  String get sex => _sex;
  String get addr1 => _addr1;
  String get addr2 => _addr2;
  String get city => _city;
  String get state => _state;
  String get zip => _zip;
  bool get fiveYears => _fiveYears;
  DateTime? get dob => _dob;

  @override
  String toString() {
    return 'PersonInfo{_fname: $_fname, _lname: $_lname, _sex: $_sex, _addr1: $_addr1, _addr2: $_addr2, _city: $_city, _state: $_state, _zip: $_zip, _fiveYears: $_fiveYears, _dob: $_dob}';
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  final PersonInfo _address = PersonInfo.empty();

  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState(_address);
}

class _HomePageState extends State<HomePage> {
  final PersonInfo _address;

  _HomePageState(this._address);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Please enter your Details"),
      ),
      body: Center(
        child: ListView(
          children: [
            Padding(
                padding: const EdgeInsets.all(20.0),
                child: AddressWidget(address: _address, onSaved: _onSaved))
          ],
        ),
      ),
    );
  }

  _onSaved(PersonInfo address) {
    showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Address'),
            content: Text(address.toString()),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text('Close'),
              )
            ],
          );
        });
  }
}

// ignore: must_be_immutable
class AddressWidget extends StatefulWidget {
  late PersonInfo _address;
  late ValueChanged<PersonInfo> _onSaved;

  AddressWidget(
      {Key? key,
      required PersonInfo address,
      required ValueChanged<PersonInfo> onSaved})
      : super(key: key) {
    _address = address;
    _onSaved = onSaved;
  }

  @override
  _AddressWidgetState createState() => _AddressWidgetState(_address);
}

class _AddressWidgetState extends State<AddressWidget> {
  static const stateDropdownMenuItems = [
    DropdownMenuItem(value: "AL", child: Text("Alabama")),
    DropdownMenuItem(value: "AK", child: Text("Alaska")),
    DropdownMenuItem(value: "AZ", child: Text("Arizona")),
    DropdownMenuItem(value: "AR", child: Text("Arkansas")),
    DropdownMenuItem(value: "CA", child: Text("California")),
    DropdownMenuItem(value: "CO", child: Text("Colorado")),
    DropdownMenuItem(value: "CT", child: Text("Connecticut")),
    DropdownMenuItem(value: "DE", child: Text("Delaware")),
    DropdownMenuItem(value: "DC", child: Text("District Of Columbia")),
    DropdownMenuItem(value: "FL", child: Text("Florida")),
    DropdownMenuItem(value: "GA", child: Text("Georgia")),
    DropdownMenuItem(value: "HI", child: Text("Hawaii")),
    DropdownMenuItem(value: "ID", child: Text("Idaho")),
    DropdownMenuItem(value: "IL", child: Text("Illinois")),
    DropdownMenuItem(value: "IN", child: Text("Indiana")),
    DropdownMenuItem(value: "IA", child: Text("Iowa")),
    DropdownMenuItem(value: "KS", child: Text("Kansas")),
    DropdownMenuItem(value: "KY", child: Text("Kentucky")),
    DropdownMenuItem(value: "LA", child: Text("Louisiana")),
    DropdownMenuItem(value: "ME", child: Text("Maine")),
    DropdownMenuItem(value: "MD", child: Text("Maryland")),
    DropdownMenuItem(value: "MA", child: Text("Massachusetts")),
    DropdownMenuItem(value: "MI", child: Text("Michigan")),
    DropdownMenuItem(value: "MN", child: Text("Minnesota")),
    DropdownMenuItem(value: "MS", child: Text("Mississippi")),
    DropdownMenuItem(value: "MO", child: Text("Missouri")),
    DropdownMenuItem(value: "MT", child: Text("Montana")),
    DropdownMenuItem(value: "NE", child: Text("Nebraska")),
    DropdownMenuItem(value: "NV", child: Text("Nevada")),
    DropdownMenuItem(value: "NH", child: Text("New Hampshire")),
    DropdownMenuItem(value: "NJ", child: Text("New Jersey")),
    DropdownMenuItem(value: "NM", child: Text("New Mexico")),
    DropdownMenuItem(value: "NY", child: Text("New York")),
    DropdownMenuItem(value: "NC", child: Text("North Carolina")),
    DropdownMenuItem(value: "ND", child: Text("North Dakota")),
    DropdownMenuItem(value: "OH", child: Text("Ohio")),
    DropdownMenuItem(value: "OK", child: Text("Oklahoma")),
    DropdownMenuItem(value: "OR", child: Text("Oregon")),
    DropdownMenuItem(value: "PA", child: Text("Pennsylvania")),
    DropdownMenuItem(value: "RI", child: Text("Rhode Island")),
    DropdownMenuItem(value: "SC", child: Text("South Carolina")),
    DropdownMenuItem(value: "SD", child: Text("South Dakota")),
    DropdownMenuItem(value: "TN", child: Text("Tennessee")),
    DropdownMenuItem(value: "TX", child: Text("Texas")),
    DropdownMenuItem(value: "UT", child: Text("Utah")),
    DropdownMenuItem(value: "VT", child: Text("Vermont")),
    DropdownMenuItem(value: "VA", child: Text("Virginia")),
    DropdownMenuItem(value: "WA", child: Text("Washington")),
    DropdownMenuItem(value: "WV", child: Text("West Virginia")),
    DropdownMenuItem(value: "WI", child: Text("Wisconsin")),
    DropdownMenuItem(value: "WY", child: Text("Wyoming")),
    DropdownMenuItem(value: 'IN', child: Text('India'))
  ];

  final _formKey = GlobalKey<FormState>();
  String _state = stateDropdownMenuItems[0].value!;
  late TextEditingController _fnameTextController;
  late TextEditingController _lnameTextController;
  String _sex = "m";
  late TextEditingController _addr1TextController;
  late TextEditingController _addr2TextController;
  late TextEditingController _cityTextController;
  late TextEditingController _zipTextController;
  bool _fiveYears = false;
  final DateFormat _dateFormat = DateFormat("dd/MM/yyyy");
  late TextEditingController _dobTextController;

  _AddressWidgetState(final PersonInfo address) {
    _fnameTextController = TextEditingController(text: address.fname);
    _lnameTextController = TextEditingController(text: address.lname);
    _sex = address.sex;
    _addr1TextController = TextEditingController(text: address.addr1);
    _addr2TextController = TextEditingController(text: address.addr2);
    _cityTextController = TextEditingController(text: address.city);
    _zipTextController = TextEditingController(text: address.state);
    _fiveYears = address.fiveYears;
    _dobTextController = TextEditingController(
        text: address.dob != null ? _dateFormat.format(address.dob!) : "");
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> formWidgetList = [];
    formWidgetList.add(createFNameWidget());
    formWidgetList.add(createLNameWidget());
    formWidgetList.add(createSexWidget());
    formWidgetList.add(createAddr1Widget());
    formWidgetList.add(createAddr2Widget());
    formWidgetList.add(createCityWidget());
    formWidgetList.add(createStateWidget());
    formWidgetList.add(createZipWidget());
    formWidgetList.add(createFiveYearsWidget());
    formWidgetList.add(createDobWidget());
    formWidgetList.add(ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          PersonInfo address = createDataObjectFromFormData();
          widget._onSaved(address);
        }
      },
      child: const Text('Save'),
    ));

    return Form(
      key: _formKey,
      child: Column(children: formWidgetList),
    );
  }

  TextFormField createFNameWidget() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your first name.';
        }
        return null;
      },
      decoration: const InputDecoration(
          icon: Icon(Icons.person),
          hintText: 'First name',
          labelText: 'Enter your first name'),
      onSaved: (String? value) {},
      controller: _fnameTextController,
      autofocus: true,
    );
  }

  TextFormField createLNameWidget() {
    return TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter your last name.';
          }
          return null;
        },
        decoration: const InputDecoration(
            icon: Icon(Icons.person),
            hintText: 'Last name',
            labelText: 'Enter your last name'),
        onSaved: (String? value) {},
        controller: _lnameTextController);
  }

  void _handleSexRadioChanged(Object? value) {
    setState(() {
      _sex = "$value";
    });
  }

  InputDecorator createSexWidget() {
    List<Widget> radioWidgets = [
      const Text("Male"),
      Radio(
          value: "m",
          groupValue: _sex,
          onChanged: (s) => _handleSexRadioChanged(s)),
      const Text("Female"),
      Radio(
          value: "f",
          groupValue: _sex,
          onChanged: (s) => _handleSexRadioChanged(s)),
    ];
    return InputDecorator(
        decoration: const InputDecoration(
          icon: Icon(Icons.person),
        ),
        child: DropdownButtonHideUnderline(child: Row(children: radioWidgets)));
  }

  TextFormField createAddr1Widget() {
    return TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter the first line of your address.';
          }
          return null;
        },
        decoration: const InputDecoration(
            icon: Icon(Icons.location_city),
            hintText: 'Address 1',
            labelText: 'Enter the first line of address'),
        onSaved: (String? value) {},
        controller: _addr1TextController);
  }

  TextFormField createAddr2Widget() {
    return TextFormField(
        decoration: const InputDecoration(
            icon: Icon(Icons.location_city),
            hintText: 'Address 2',
            labelText: 'Enter the second line of address'),
        onSaved: (String? value) {},
        controller: _addr2TextController);
  }

  TextFormField createCityWidget() {
    return TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter your city.';
          }
          return null;
        },
        decoration: const InputDecoration(
            icon: Icon(Icons.location_city),
            hintText: 'City',
            labelText: 'Enter the city name'),
        onSaved: (String? value) {},
        controller: _cityTextController);
  }

  InputDecorator createStateWidget() {
    DropdownButton<String> stateDropdownButton = DropdownButton<String>(
        items: stateDropdownMenuItems,
        value: _state,
        isDense: true,
        onChanged: (String? value) {
          setState(() {
            _state = "$value";
          });
        });
    return InputDecorator(
        decoration: const InputDecoration(
          icon: Icon(Icons.location_city),
          hintText: 'Select the State',
          labelText: 'Select the State',
        ),
        child: DropdownButtonHideUnderline(child: stateDropdownButton));
  }

  TextFormField createZipWidget() {
    return TextFormField(
        validator: (value) {
          if ((value!.isEmpty) || (value.length < 5)) {
            return 'Please enter your 5 digit zip.';
          }
          return null;
        },
        maxLength: 5,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        keyboardType: TextInputType.phone,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: const InputDecoration(
            icon: Icon(Icons.location_city),
            hintText: 'Zip',
            labelText: 'Enter your zip'),
        onSaved: (String? value) {},
        controller: _zipTextController);
  }

  InputDecorator createFiveYearsWidget() {
    Checkbox fiveYearsCheckbox = Checkbox(
        value: _fiveYears,
        onChanged: (value) {
          setState(() {
            _fiveYears = value!;
          });
        });
    return InputDecorator(
        decoration: const InputDecoration(
          icon: Icon(Icons.calendar_today),
          hintText: 'Been at address 5 years?',
          labelText: '5 years?',
        ),
        child: DropdownButtonHideUnderline(
            child: Row(children: [
          fiveYearsCheckbox,
          const Text("Been at address 5 years?")
        ])));
  }

  DateTimeField createDobWidget() {
    return DateTimeField(
        validator: (value) {
          if ((value == null)) {
            return 'Please enter your date of birth.';
          }
          return null;
        },
        onShowPicker: (context, currentValue) async {
          final firstDate = DateTime.now().add(const Duration(days: -365 * 5));
          final lastDate = DateTime.now();
          final time = await showDatePicker(
            context: context,
            initialDate: currentValue ?? DateTime.now(),
            firstDate: firstDate,
            lastDate: lastDate,
          );
          return time;
        },
        format: _dateFormat,
        decoration: const InputDecoration(
            icon: Icon(Icons.date_range),
            hintText: 'Date',
            labelText: 'Select the Date'),
        controller: _dobTextController);
  }

  PersonInfo createDataObjectFromFormData() {
    return PersonInfo(
        _fnameTextController.text,
        _lnameTextController.text,
        _sex,
        _addr1TextController.text,
        _addr2TextController.text,
        _cityTextController.text,
        _state,
        _zipTextController.text,
        _fiveYears,
        _dateFormat.parse(_dobTextController.text));
  }
}
