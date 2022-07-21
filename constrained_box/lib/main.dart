import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    for (var i = 0; i < counter; i++) {
      children.add(Container(
        child: Text('Row ${i + 1}'),
      ));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('No of Rows ${counter}'),
            ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 300.0,
                maxHeight: 350.0,
                minWidth: 200.0,
                maxWidth: 250.0,
              ),
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                padding: const EdgeInsets.all(5.0),
                child: ListView(
                  children: [
                    ...children,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: increment,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
