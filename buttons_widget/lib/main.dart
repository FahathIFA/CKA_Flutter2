import 'package:flutter/material.dart';

void main() => runApp(ButtonApp());

class ButtonApp extends StatelessWidget {
  // This widget is the root of your application.
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
    var flatButtonRow =
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      TextButton(
          onPressed: () => debugPrint('TextButton pressed'),
          child: const Text('TextButton')),
      const Text("TextButton")
    ]);
    Row raisedButtonRow =
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      ElevatedButton(
          onPressed: () => debugPrint('ElevatedButton pressed'),
          child: const Text(
            'ElevatedButton',
            style: TextStyle(color: Colors.orange),
          )),
      const Text("ElevatedButton")
    ]);
    Row iconButtonRow = Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => debugPrint('IconButton pressed')),
          const Text("IconButton")
        ]);
    Row outlineButtonRow = Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          OutlinedButton(
              onPressed: () => debugPrint('OutlinedButton pressed'),
              child: const Text("OutlinedButton")),
          const Text("OutlinedButton")
        ]);

    var dropdownButtonRow = Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          DropdownButton<String>(
              items: <String>['Mens', 'Womans'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) => debugPrint('Changed: $value')),
          const Text("DropdownButton")
        ]);

    Row backButtonRow = Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [BackButton(), Text("BackButton")]);

    Row closeButtonRow = Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [CloseButton(), Text("CloseButton")]);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Buttons"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            flatButtonRow,
            raisedButtonRow,
            iconButtonRow,
            outlineButtonRow,
            dropdownButtonRow,
            backButtonRow,
            closeButtonRow,
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => debugPrint('FloatingActionButton pressed'),
          child: const Text("F.A.B")),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
