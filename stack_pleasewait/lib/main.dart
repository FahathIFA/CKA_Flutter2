import 'package:flutter/material.dart';

void main() => runApp(const StackPleaseWait());

class StackPleaseWait extends StatelessWidget {
  const StackPleaseWait({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: HomeWidget(
        title: 'Card Layout Demo',
      ),
    );
  }
}

class HomeWidget extends StatefulWidget {
  HomeWidget({Key? key, required this.title}) : super(key: key);

  final String title;
  final PleaseWaitWidget _pleaseWaitWidget = const PleaseWaitWidget();
  final AppWidget _appwidget = const AppWidget();

  // void _toggleSwit

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  bool _pleaseWait = false;

  void _toggleSwitch() {
    setState(() {
      _pleaseWait = !_pleaseWait;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> childWidget = _pleaseWait
        ? [widget._pleaseWaitWidget, widget._appwidget]
        : [widget._appwidget];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Stack(
          children: [...childWidget],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _toggleSwitch,
        label: const Text('Switch On/Off'),
        icon: const Icon(Icons.cached),
      ),
    );
  }
}

class PleaseWaitWidget extends StatelessWidget {
  const PleaseWaitWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.3),
      child: const Center(
        child: CircularProgressIndicator(
          strokeWidth: 8.0,
        ),
      ),
    );
  }
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List textAlign = [
      const Align(
          alignment: Alignment.centerRight,
          child: Text('Your',
              style: TextStyle(fontSize: 19.0, color: Colors.orange))),
      const Align(
        alignment: Alignment.centerLeft,
        child: Text('App',
            style: TextStyle(fontSize: 19.0, color: Colors.redAccent)),
      ),
      const Align(
          alignment: Alignment.centerRight,
          child: Text('Goes',
              style: TextStyle(fontSize: 19.0, color: Colors.lime))),
      const Align(
        alignment: Alignment.centerLeft,
        child: Text('Here',
            style: TextStyle(fontSize: 19.0, color: Colors.deepPurpleAccent)),
      ),
    ];
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [...textAlign],
      ),
    );
  }
}
