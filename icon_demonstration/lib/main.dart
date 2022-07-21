import 'package:flutter/material.dart';

void main() => runApp(const IconApp());

class IconApp extends StatelessWidget {
  const IconApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeWidget(),
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Row row1 = Row(
        mainAxisAlignment: MainAxisAlignment.center, // center horizontally
        children: const [
          Icon(Icons.add),
          Text("Default size 24, default color black")
        ]);
    Row row2 =
        Row(mainAxisAlignment: MainAxisAlignment.center, // center horizontally
            children: const [
          Icon(Icons.add, size: 48.0),
          Text("Specified size 48, default color black",
              style: TextStyle(
                color: Colors.red,
              ))
        ]);
    Row row3 =
        Row(mainAxisAlignment: MainAxisAlignment.center, // center horizontally
            children: const [
          Icon(Icons.add, size: 96.0, color: Colors.red),
          Text("Specified size 96, specified color red",
              style: TextStyle(
                fontSize: 36,
              ))
        ]);
    SingleChildScrollView scrollView = SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly, // center vertically
        children: [
          Expanded(child: row1),
          Expanded(child: row2),
          Expanded(child: row3),
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(title: const Text("Icons")),
      body: scrollView,
    );
  }
}
