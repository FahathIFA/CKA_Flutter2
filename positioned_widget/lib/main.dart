import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _top = 0.0;
  double _left = 0.0;

  bool _toggle = false;

  final List<Widget> _boxChild = [];

  final _random = Random();

  int next(int min, int max) => min + _random.nextInt(max - min);

  void _refresh() {
    setState(() {
      _top = 0.0;
      _left = 0.0;
      _boxChild.clear();
    });
  }

  void _addLayer() {
    setState(() {
      _boxChild.add(
        Positioned(
          left: _left,
          top: _top,
          child: Container(
            height: 100.0,
            width: 100.0,
            decoration: BoxDecoration(
              shape: _toggle ? BoxShape.circle : BoxShape.rectangle,
              border: Border.all(width: 1.0, color: Colors.grey),
              color:
                  Color.fromRGBO(next(0, 255), next(0, 255), next(0, 255), 0.5),
            ),
          ),
        ),
      );
    });
    _toggle = !_toggle;
    _left += 30.0;
    _top += 30.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Positioned Widget'),
        actions: [
          IconButton(
              onPressed: () => _refresh(), icon: const Icon(Icons.refresh))
        ],
      ),
      body: Stack(
        children: [..._boxChild],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addLayer,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
