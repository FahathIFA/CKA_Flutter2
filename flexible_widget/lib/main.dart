import 'package:flutter/material.dart';

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
      home: const HomeWidget(),
    );
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  bool _topTightFit = false;
  bool _bottomExpanded = false;

  toggleTop() {
    setState(() => _topTightFit = !_topTightFit);
  }

  toggleBottom() {
    setState(() => _bottomExpanded = !_bottomExpanded);
  }

  @override
  Widget build(BuildContext context) {
    Container topContainer = Container(
      constraints: const BoxConstraints(
          minHeight: 100.0, minWidth: 100.0, maxHeight: 200.0, maxWidth: 200.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1.0),
          color: Colors.blue),
      padding: const EdgeInsets.all(10.0),
      child: const Text(
        'Top Container',
      ),
    );
    Container bottomContainer = Container(
      constraints: const BoxConstraints(
          minHeight: 100.0, minWidth: 100.0, maxHeight: 200.0, maxWidth: 200.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1.0),
          color: Colors.yellow),
      padding: const EdgeInsets.all(10.0),
      child: const Text(
        'Bottom Container',
      ),
    );
    Widget topWidget = Flexible(
        fit: _topTightFit ? FlexFit.tight : FlexFit.loose, child: topContainer);
    Widget bottomWidget =
        _bottomExpanded ? Expanded(child: bottomContainer) : bottomContainer;
    String toolbarTextTop = "Top (${_topTightFit ? "tight" : "loose"})";
    String toolbarTextBottom =
        "Bottom (${_bottomExpanded ? "expanded" : "not expanded"})";
    return Scaffold(
        appBar: AppBar(
            title: const Text(
              "Expanded",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            actions: <Widget>[
              TextButton.icon(
                  icon: Icon(
                    _topTightFit
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_up,
                    color: Colors.white,
                  ),
                  label: Text(
                    toolbarTextTop,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () => toggleTop()),
              TextButton.icon(
                  icon: Icon(
                    _bottomExpanded
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                  label: Text(
                    toolbarTextBottom,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
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
