import 'package:flutter/material.dart';

void main() => runApp(const ContainerApp());

class ContainerApp extends StatelessWidget {
  const ContainerApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomeWidget(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget>
    with SingleTickerProviderStateMixin {
  Animation<double>? _animation;
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller!)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 2.0),
              borderRadius: const BorderRadius.all(
                Radius.circular(20.0),
              ),
              color: Colors.cyan),
          child: RotationTransition(
            turns: AlwaysStoppedAnimation(_animation!.value),
            child: const Icon(
              Icons.airplanemode_active,
              size: 150.0,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _next,
        child: const Icon(Icons.refresh),
      ),
    );
  }

  void _next() {
    _controller!.forward(from: 0.0);
  }
}
