import 'package:flutter/material.dart';

void main() => runApp(const RowMainAxisAlignmentApp());

class RowMainAxisAlignmentApp extends StatelessWidget {
  const RowMainAxisAlignmentApp({Key? key}) : super(key: key);

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

class HomeWidget extends StatelessWidget {
  HomeWidget({Key? key}) : super(key: key);

  var listView = [
    const Text(
      "MainAxisAlignment",
      style: TextStyle(fontSize: 20.0),
    ),
    const Text(
      "is",
      style: TextStyle(fontSize: 20.0),
    ),
    const Text(
      "center",
      style: TextStyle(fontSize: 20.0),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Rows")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: listView,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: listView),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const <Widget>[
                Text("MainAxisAlignment"),
                Text("is"),
                Text("spaceAround")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const <Widget>[
                Text("MainAxisAlignment"),
                Text("is"),
                Text("spaceEvenly")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Text("MainAxisAlignment"),
                Text("is"),
                Text("spaceBetween")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const <Widget>[
                Text("MainAxisAlignment"),
                Text("is"),
                Text("start")
              ],
            ),
          ],
        ));
  }
}
