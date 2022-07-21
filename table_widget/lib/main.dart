import 'package:flutter/material.dart';

void main() => runApp(const TableApp());

class TableApp extends StatelessWidget {
  const TableApp({Key? key}) : super(key: key);

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
    TableRow tableRow = TableRow(children: [
      Container(
        padding: const EdgeInsets.all(10),
        child: const Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            overflow: TextOverflow.fade),
      ),
      Container(
        padding: const EdgeInsets.all(10),
        child: const Text(
            "It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
            overflow: TextOverflow.fade),
      ),
      Container(
        padding: const EdgeInsets.all(10),
        child: const Text(
            "It was in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            overflow: TextOverflow.ellipsis),
      )
    ]);
    return Scaffold(
      appBar: AppBar(title: const Text("Table")),
      body: SingleChildScrollView(
        child: Table(
          children: [
            tableRow,
            tableRow,
            tableRow,
            tableRow,
            tableRow,
            tableRow,
            tableRow,
            tableRow,
            tableRow,
          ],
          columnWidths: const <int, TableColumnWidth>{
            0: FlexColumnWidth(0.3),
            1: FlexColumnWidth(0.3),
            2: FlexColumnWidth(0.3),
          },
          border: TableBorder.all(
              width: 2,
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey),
        ),
      ),
    );
  }
}
