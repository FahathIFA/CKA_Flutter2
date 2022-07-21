import 'package:flutter/material.dart';

void main() => runApp(const ColumnSpacedEvenly());

class ColumnSpacedEvenly extends StatelessWidget {
  const ColumnSpacedEvenly({Key? key}) : super(key: key);

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
    var yellowButton = RawMaterialButton(
      onPressed: () {},
      fillColor: Colors.yellow,
      elevation: 10.0,
    );

    RawMaterialButton redButton = RawMaterialButton(
      onPressed: () {},
      elevation: 2.0,
      fillColor: Colors.red,
    );
    RawMaterialButton greenButton = RawMaterialButton(
      constraints: const BoxConstraints(maxWidth: 900),
      onPressed: () {},
      elevation: 2.0,
      fillColor: Colors.green,
      child: const Text('hello with maximum raw button to be used '),
      // shape: const CircleBorder(),
    );
    RawMaterialButton blueButton = RawMaterialButton(
      onPressed: () {},
      elevation: 2.0,
      fillColor: Colors.blue,
    );
    return Scaffold(
        appBar: AppBar(
          title: const Text("Column"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(child: redButton),
              Expanded(child: greenButton),
              Expanded(child: blueButton),
              Expanded(child: yellowButton)
            ],
          ),
        ));
  }
}
