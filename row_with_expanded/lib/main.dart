import 'package:flutter/material.dart';

void main() => runApp(const RowWithExpandedApp());

class RowWithExpandedApp extends StatelessWidget {
  const RowWithExpandedApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const HomeWidget(),
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Rows")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "None expanded:",
              style: TextStyle(
                color: Colors.lime,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("aaaaaaaaaa"),
                Text("bbbbbbbbbb"),
                Text("cccccccccc")
              ],
            ),
            Text(
              "1st child expanded:",
              style: Theme.of(context).textTheme.headline2,
            ),
            Row(
              children: const [
                Expanded(child: Text("aaaaaaaaaa")),
                Text("bbbbbbbbbb"),
                Text("cccccccccc")
              ],
            ),
            const Text(
              "2nd child expanded:",
              style: TextStyle(color: Colors.deepOrangeAccent),
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("aaaaaaaaaa"),
                Expanded(
                  child: RawMaterialButton(
                    constraints: const BoxConstraints(),
                    onPressed: () {},
                    fillColor: Colors.red,
                    child: const Text('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb'),
                  ),
                ),
                // Text("aaaaaaaaaa"),
                // Expanded(child: Text("bbbbbbbbbb")),
                const Text("cccccccccc")
              ],
            ),
            const Text(
              "3rd child expanded:",
              style: TextStyle(color: Colors.deepPurpleAccent),
            ),
            Row(
              children: const [
                Text("aaaaaaaaaa"),
                Text("bbbbbbbbbb"),
                Expanded(child: Text("cccccccccc"))
              ],
            ),
            Row(
              children: [
                RawMaterialButton(
                  onPressed: () {},
                  fillColor: Colors.greenAccent,
                ),
                Expanded(
                  child: RawMaterialButton(
                    onPressed: () {},
                    fillColor: Colors.black,
                  ),
                ),
                Expanded(
                  child: RawMaterialButton(
                    onPressed: () {},
                    fillColor: Colors.deepPurple,
                  ),
                )
              ],
            )
          ],
        ));
  }
}
