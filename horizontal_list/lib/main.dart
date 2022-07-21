import 'package:flutter/material.dart';

void main() => runApp(HorizontalListApp());

class HorizontalListApp extends StatelessWidget {
  const HorizontalListApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'Horizontal List';
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 20.0),
          height: 250.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                width: 160.0,
                height: 200.0,
                color: Colors.red,
                child: const Center(
                  child: Text(
                    'Blue',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0),
                  ),
                ),
              ),
              Container(
                // width: 160.0,
                height: 12.0,
                color: Colors.blue,
                child: const Text('RED'),
              ),
              Container(
                width: 160.0,
                color: Colors.green,
              ),
              Container(
                width: 160.0,
                color: Colors.yellow,
              ),
              Container(
                width: 160.0,
                color: Colors.orange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
