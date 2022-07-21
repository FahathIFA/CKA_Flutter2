import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const HomeWidget(),
    );
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  static const double tWenty = 20.0;
  static const List<String> _titles = [
    "all 20.0",
    "left 20.0",
    "right 20.0",
    "top 20.0",
    "bottom 20.0",
    "sym horiz 20.0",
    "sym vert 20.0"
  ];
  static const List<EdgeInsets> _edgeInsets = [
    EdgeInsets.all(tWenty),
    EdgeInsets.only(left: tWenty),
    EdgeInsets.only(right: tWenty),
    EdgeInsets.only(top: tWenty),
    EdgeInsets.only(bottom: tWenty),
    EdgeInsets.symmetric(horizontal: tWenty),
    EdgeInsets.symmetric(vertical: tWenty)
  ];

  final List<Color> _colorChange = [
    Colors.black,
    Colors.blue,
    Colors.green,
    Colors.deepPurple,
    Colors.indigo,
    Colors.orangeAccent,
    Colors.redAccent
  ];

  int _index = 0;

  void _next() {
    setState(() {
      _index++;
      if (_index >= _titles.length) {
        _index = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Container childContain = Container(
      color: _colorChange[_index],
      // color: Colors.black,
    );
    Padding paddings = Padding(
      padding: _edgeInsets[_index],
      child: childContain,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_index]),
        actions: [
          IconButton(
            onPressed: () => _next(),
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(),
        child: paddings,
      ),
    );
  }
}
