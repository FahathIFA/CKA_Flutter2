import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
  bool _topExpanded = false;
  bool _bottomExpanded = false;

  toggleTop() {
    setState(() => _topExpanded = !_topExpanded);
  }

  toggleBottom() {
    setState(() => _bottomExpanded = !_bottomExpanded);
  }

  @override
  Widget build(BuildContext context) {
    Container topContainer = Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1.0),
          color: Colors.blue),
      padding: const EdgeInsets.all(10.0),
      child: const Text(
        'Top Container',
      ),
    );
    Container bottomContainer = Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1.0),
          color: Colors.yellow),
      padding: const EdgeInsets.all(10.0),
      child: const Text(
        'Bottom Container',
      ),
    );
    Widget topWidget =
        _topExpanded ? Expanded(child: topContainer) : topContainer;
    Widget bottomWidget =
        _bottomExpanded ? Expanded(child: bottomContainer) : bottomContainer;
    return Scaffold(
        appBar: AppBar(title: const Text("Expanded"), actions: <Widget>[
          TextButton.icon(
              icon: Icon(
                _topExpanded ? Icons.expand_more : Icons.expand_less,
                color: Colors.white,
              ),
              label: const Text(
                "Top",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => toggleTop()),
          TextButton.icon(
              icon: Icon(
                _bottomExpanded ? Icons.expand_less : Icons.expand_more,
                color: Colors.white,
              ),
              label: const Text("Bottom",
                  style: TextStyle(
                    color: Colors.white,
                  )),
              onPressed: () => toggleBottom())
        ]),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[topWidget, bottomWidget],
          ),
        ));
  }
}
