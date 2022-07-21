import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Styled Text Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class TextBlock {
  final Color _color;
  final String _text;
  final double _size;

  TextBlock(this._color, this._text, this._size);

  String get text => _text;

  Color get color => _color;

  double get size => _size;
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 0;
  final List<TextBlock> textBlocks = [
    TextBlock(Colors.red, 'SchoolBoy', 20.0),
    TextBlock(Colors.red, 'every', 88.0),
    TextBlock(Colors.redAccent, ' schoolboy', 39.9),
    TextBlock(Colors.green, '\nknows', 40.0),
    TextBlock(Colors.greenAccent, ' who', 18.9),
    TextBlock(Colors.blue, '\nimprisoned', 30.4),
    TextBlock(Colors.blueAccent, '\nMontezuma', 10.3),
    TextBlock(Colors.red, 'SchoolBoy', 20.0),
    TextBlock(Colors.red, 'every', 88.0),
    TextBlock(Colors.redAccent, ' schoolboy', 39.9),
    TextBlock(Colors.green, '\nknows', 40.0),
    TextBlock(Colors.greenAccent, ' who', 18.9),
    TextBlock(Colors.blue, '\nimprisoned', 30.4),
    TextBlock(Colors.blueAccent, '\nMontezuma', 10.3),
    TextBlock(Colors.red, 'SchoolBoy', 20.0),
    TextBlock(Colors.red, 'every', 88.0),
    TextBlock(Colors.redAccent, ' schoolboy', 39.9),
    TextBlock(Colors.green, '\nknows', 40.0),
    TextBlock(Colors.greenAccent, ' who', 18.9),
    TextBlock(Colors.blue, '\nimprisoned', 30.4),
    TextBlock(Colors.blueAccent, '\nMontezuma', 10.3),
    TextBlock(Colors.red, 'SchoolBoy', 20.0),
    TextBlock(Colors.red, 'every', 88.0),
    TextBlock(Colors.redAccent, ' schoolboy', 39.9),
    TextBlock(Colors.green, '\nknows', 40.0),
    TextBlock(Colors.greenAccent, ' who', 18.9),
    TextBlock(Colors.blue, '\nimprisoned', 30.4),
    TextBlock(Colors.blueAccent, '\nMontezuma', 10.3),
  ];

  void _incrementCounter() {
    setState(() {
      if (_index < textBlocks.length) {
        _index++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<TextSpan> textSpans = [];
    for (var i = 0; i < _index; i++) {
      TextBlock textBlock = textBlocks[i];
      textSpans.add(
        TextSpan(
          text: textBlock.text,
          style: TextStyle(color: textBlock.color, fontSize: textBlock.size),
        ),
      );
    }

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text.rich(
                TextSpan(children: textSpans),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.note_add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
