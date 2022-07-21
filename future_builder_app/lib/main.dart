import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Future Builder App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeWidget(),
    );
  }
}

class HomeWidget extends StatefulWidget {
  HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  bool _showCalculation = false;

  void _onInvokeFuturePressed() {
    setState(() {
      _showCalculation = !_showCalculation;
    });
  }

  String computeListOfTimestamps(count) {
    var dateTi = DateFormat("d MM yyyy h:mm a EEE").format(DateTime.now());
    StringBuffer sb = StringBuffer();
    for (int i = 0; i < count; i++) {
      sb.writeln('${i + 1} : $dateTi');
    }

    return sb.toString();
  }

  Future createFutureCalculation(int count) {
    return Future.delayed(const Duration(seconds: 4), () {
      return computeListOfTimestamps(count);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget child = _showCalculation
        ? FutureBuilder(
            future: createFutureCalculation(1000),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [CircularProgressIndicator()],
                  ),
                );
              } else {
                return Expanded(
                    child: SingleChildScrollView(
                  child: Text(
                    '${snapshot.data ?? 'Loading...'}',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ));
              }
            })
        : const Text('hit the button to show calculation');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Builder App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [child],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onInvokeFuturePressed,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
