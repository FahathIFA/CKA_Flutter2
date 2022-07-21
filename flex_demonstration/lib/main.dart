import 'package:flutter/material.dart';

void main() => runApp(const myApp());

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flex Demonstration',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeWidget(title: 'Flex'),
    );
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  var _alignmentIndex = 0;
  bool _vertical = true;
  int colorIndex = 0;

  final List<MainAxisAlignment> _alignment = [
    MainAxisAlignment.start,
    MainAxisAlignment.end,
    MainAxisAlignment.center,
    MainAxisAlignment.spaceBetween,
    MainAxisAlignment.spaceEvenly,
    MainAxisAlignment.spaceAround
  ];

  List<Color> col = [
    Colors.red,
    Colors.green,
    Colors.purple,
    Colors.teal,
    Colors.lime,
  ];

  final List<String> _alignmentText = [
    'Start',
    'End',
    "Center",
    "Soace Between",
    "Space Evenly",
    "Space Around"
  ];

  void colorChange() {
    setState(() {
      colorIndex++;
      if (colorIndex >= col.length) {
        colorIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> appBarAction = [
      IconButton(
        onPressed: () {
          setState(() {
            _vertical = !_vertical;
          });
        },
        icon: const Icon(Icons.refresh),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: _vertical ? const Text('Vertical') : const Text('Horizontal'),
      ),
      const Padding(padding: EdgeInsets.all(10.0)),
      IconButton(
        onPressed: () {
          setState(() {
            _alignmentIndex++;
            if (_alignmentIndex >= _alignment.length) {
              _alignmentIndex = 0;
            }
          });
        },
        icon: const Icon(Icons.start),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Text(_alignmentText[_alignmentIndex]),
      ),
      const Padding(
        padding: EdgeInsets.all(10.0),
      ),
    ];
    RawMaterialButton redButton = RawMaterialButton(
      onPressed: () {},
      fillColor: col[colorIndex],
      elevation: 2.0,
      // shape: const CircleBorder(),
      child: const Text('Red'),
    );
    RawMaterialButton blueButton = RawMaterialButton(
      onPressed: () {},
      fillColor: col[colorIndex],
      elevation: 2.0,
      // shape: const CircleBorder(),
      child: const Text('Blue'),
    );
    RawMaterialButton greenButton = RawMaterialButton(
      onPressed: () {},
      fillColor: col[colorIndex],
      elevation: 2.0,
      // shape: const CircleBorder(),
      child: const Text('Green'),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: appBarAction,
      ),
      body: Flex(
        direction: _vertical ? Axis.vertical : Axis.horizontal,
        mainAxisAlignment: _alignment[_alignmentIndex],
        children: [
          redButton,
          blueButton,
          greenButton,
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: colorChange,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
