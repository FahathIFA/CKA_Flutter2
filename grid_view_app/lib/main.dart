// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

void main() => runApp(const GridViewApp());

class GridOptions {
  final int _crossAxisCountPortrait;
  final int _crossAxisCountLandscape;
  final double _childAspectRatio;
  final double _padding;
  final double _spacing;

  GridOptions(this._crossAxisCountPortrait, this._crossAxisCountLandscape,
      this._childAspectRatio, this._padding, this._spacing);

  @override
  String toString() {
    return 'GridOptions{_crossAxisCountPortrait: $_crossAxisCountPortrait, _crossAxisCountLandscape: $_crossAxisCountLandscape, _childAspectRatio: $_childAspectRatio, _padding: $_padding, _spacing: $_spacing}';
  }
}

class GridViewApp extends StatelessWidget {
  const GridViewApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeWidget(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final List<Widget> _kittenTiles = [];
  int _gridOptionsIndex = 0;
  final List<GridOptions> _gridOptions = [
    GridOptions(2, 3, 1.0, 10.0, 10.0),
    GridOptions(3, 4, 1.0, 10.0, 10.0),
    GridOptions(4, 5, 1.0, 10.0, 10.0),
    GridOptions(2, 3, 1.0, 10.0, 10.0),
    GridOptions(2, 3, 1.5, 10.0, 10.0),
    GridOptions(2, 3, 2.0, 10.0, 10.0),
    GridOptions(2, 3, 1.0, 10.0, 10.0),
    GridOptions(2, 3, 1.5, 20.0, 10.0),
    GridOptions(2, 3, 2.0, 30.0, 10.0),
    GridOptions(2, 3, 1.0, 10.0, 10.0),
    GridOptions(2, 3, 1.5, 10.0, 20.0),
    GridOptions(2, 3, 2.0, 10.0, 30.0),
  ];

  _HomeWidgetState() : super() {
    for (int i = 200; i < 1000; i += 100) {
      String imageUrl = "http://placekitten.com/200/$i";
      _kittenTiles.add(GridTile(
          header: const GridTileBar(
            title: Text("Cats", style: TextStyle(fontWeight: FontWeight.bold)),
            backgroundColor: Color.fromRGBO(0, 0, 0, 0.5),
          ),
          footer: const GridTileBar(
              title: Text("How cute",
                  textAlign: TextAlign.right,
                  style: TextStyle(fontWeight: FontWeight.bold))),
          child: Image.network(imageUrl, fit: BoxFit.cover)));
    }
  }

  void _tryMoreGridOptions() {
    setState(() {
      _gridOptionsIndex++;
      if (_gridOptionsIndex >= (_gridOptions.length - 1)) {
        _gridOptionsIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    GridOptions options = _gridOptions[_gridOptionsIndex];
    return Scaffold(
      appBar: AppBar(
        title: const Text("GridView"),
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        return GridView.count(
            crossAxisCount: (orientation == Orientation.portrait)
                ? options._crossAxisCountPortrait
                : options._crossAxisCountLandscape,
            childAspectRatio: options._childAspectRatio,
            padding: EdgeInsets.all(options._padding),
            mainAxisSpacing: options._spacing,
            crossAxisSpacing: options._spacing,
            children: _kittenTiles);
      }),
      bottomNavigationBar: Container(
          padding: const EdgeInsets.all(20.0), child: Text(options.toString())),
      floatingActionButton: FloatingActionButton(
        onPressed: _tryMoreGridOptions,
        tooltip: 'Try more grid options',
        child: const Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
