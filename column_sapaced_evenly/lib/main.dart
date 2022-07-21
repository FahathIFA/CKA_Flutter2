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
    Row rowCir1 = Row(
      children: [
        RawMaterialButton(
          constraints: const BoxConstraints(minWidth: 188.0, minHeight: 136.0),
          onPressed: () {
            debugPrint('red button pressed');
          },
          shape: const CircleBorder(),
          elevation: 10.0,
          fillColor: Colors.red,
          padding: const EdgeInsets.all(15.0),
          child: const Text(
            'Red hello',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
        RawMaterialButton(
          constraints: const BoxConstraints(minWidth: 20.0, minHeight: 136.0),
          onPressed: () {
            debugPrint('Green button pressed');
          },
          shape: const CircleBorder(),
          elevation: 2.0,
          fillColor: Colors.green,
          padding: const EdgeInsets.all(15.0),
          child: const Text(
            'Red hello',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
      ],
    );
    Row rowCir2 = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RawMaterialButton(
          constraints: const BoxConstraints(minWidth: 18.0, minHeight: 136.0),
          onPressed: () {
            debugPrint('red button pressed');
          },
          shape: const CircleBorder(),
          elevation: 10.0,
          fillColor: Colors.red,
          padding: const EdgeInsets.all(15.0),
          child: const Text(
            'Red hello',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
        RawMaterialButton(
          constraints: const BoxConstraints(minWidth: 18.0, minHeight: 136.0),
          onPressed: () {
            debugPrint('Green button pressed');
          },
          shape: const CircleBorder(),
          elevation: 2.0,
          fillColor: Colors.green,
          padding: const EdgeInsets.all(15.0),
        ),
      ],
    );
    Row rowCir3 = Row(
      children: [
        RawMaterialButton(
          constraints: const BoxConstraints(minWidth: 18.0, minHeight: 16.0),
          onPressed: () {
            debugPrint('red button pressed');
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          elevation: 10.0,
          fillColor: Colors.red,
          padding: const EdgeInsets.all(15.0),
          child: const Text(
            'Red hello',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
        RawMaterialButton(
          constraints: const BoxConstraints(minWidth: 188.0, minHeight: 136.0),
          onPressed: () {
            debugPrint('Green button pressed');
          },
          shape: const CircleBorder(),
          elevation: 2.0,
          fillColor: Colors.green,
          padding: const EdgeInsets.all(15.0),
        ),
      ],
    );

    RawMaterialButton redButton = RawMaterialButton(
      constraints: const BoxConstraints(minWidth: 188.0, minHeight: 136.0),
      onPressed: () {
        debugPrint('red button pressed');
      },
      shape: const CircleBorder(),
      elevation: 10.0,
      fillColor: Colors.red,
      padding: const EdgeInsets.all(15.0),
      child: const Text(
        'Red hello',
        style: TextStyle(color: Colors.white, fontSize: 20.0),
      ),
    );
    RawMaterialButton greenButton = RawMaterialButton(
      constraints: const BoxConstraints(minWidth: 188.0, minHeight: 136.0),
      onPressed: () {
        debugPrint('Green button pressed');
      },
      shape: const CircleBorder(),
      elevation: 2.0,
      fillColor: Colors.green,
      padding: const EdgeInsets.all(15.0),
    );
    RawMaterialButton blueButton = RawMaterialButton(
      constraints: const BoxConstraints(minWidth: 188.0, minHeight: 136.0),
      onPressed: () {
        debugPrint('blue button pressed');
      },
      shape: const CircleBorder(),
      elevation: 2.0,
      fillColor: Colors.blue,
      padding: const EdgeInsets.all(15.0),
    );
    return Scaffold(
        appBar: AppBar(
          title: const Text("Column"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            // children: [redButton, greenButton, blueButton],
            children: [
              rowCir1,
              rowCir2,
              rowCir3,
            ],
          ),
        ));
  }
}
