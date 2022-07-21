// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

void main() => runApp(const GridViewApp());

class GridOptions {
  int _crossAxisCountPortrait;
  int _crossAxisCountLandscape;
  double _childAspectRatio;
  double _padding;
  double _spacing;

  GridOptions(this._crossAxisCountPortrait, this._crossAxisCountLandscape,
      this._childAspectRatio, this._padding, this._spacing);

  GridOptions.copyOf(GridOptions gridOptions)
      : this._crossAxisCountPortrait = gridOptions._crossAxisCountPortrait,
        this._crossAxisCountLandscape = gridOptions._crossAxisCountLandscape,
        this._childAspectRatio = gridOptions._childAspectRatio,
        this._padding = gridOptions._padding,
        this._spacing = gridOptions._spacing;

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
      home: HomeWidget(),
    );
  }
}

// ignore: must_be_immutable
class CustomDialogWidget extends StatefulWidget {
  final GridOptions _gridOptions;
  const CustomDialogWidget(this._gridOptions, {Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomDialogWidgetState createState() =>
      // ignore: no_logic_in_create_state
      _CustomDialogWidgetState(GridOptions.copyOf(this._gridOptions));
}

class _CustomDialogWidgetState extends State<CustomDialogWidget> {
  final GridOptions _gridOptions;

  _CustomDialogWidgetState(this._gridOptions);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400.0,
        width: 250.0,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          const Text(
            "Grid Options",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Spacer(),
            const Text("Cross Axis Count Portrait"),
            const Spacer(),
            DropdownButton<int>(
              value: _gridOptions._crossAxisCountPortrait,
              items: <int>[2, 3, 4, 5, 6].map((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _gridOptions._crossAxisCountPortrait = newValue!;
                });
              },
            ),
            const Spacer(),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Spacer(),
            const Text("Cross Axis Count Landscape"),
            const Spacer(),
            DropdownButton<int>(
              value: _gridOptions._crossAxisCountLandscape,
              items: <int>[2, 3, 4, 5, 6].map((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _gridOptions._crossAxisCountLandscape = newValue!;
                });
              },
            ),
            const Spacer(),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Spacer(),
            const Text("Aspect Ratio"),
            const Spacer(),
            DropdownButton<double>(
              value: _gridOptions._childAspectRatio,
              items: <double>[1.0, 1.5, 2.0, 2.5].map((double value) {
                return DropdownMenuItem<double>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _gridOptions._childAspectRatio = newValue!;
                });
              },
            ),
            const Spacer(),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Spacer(),
            const Text("Padding"),
            const Spacer(),
            DropdownButton<double>(
              value: _gridOptions._padding,
              items:
                  <double>[1.0, 2.0, 4.0, 8.0, 16.0, 32.0].map((double value) {
                return DropdownMenuItem<double>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _gridOptions._padding = newValue!;
                });
              },
            ),
            const Spacer(),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Spacer(),
            const Text("Spacing"),
            const Spacer(),
            DropdownButton<double>(
              value: _gridOptions._spacing,
              items:
                  <double>[1.0, 2.0, 4.0, 8.0, 16.0, 32.0].map((double value) {
                return DropdownMenuItem<double>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _gridOptions._spacing = newValue!;
                });
              },
            ),
            const Spacer(),
          ]),
          TextButton(
              child: const Text("Apply"),
              onPressed: () => Navigator.pop(context, _gridOptions))
        ]));
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final List<Widget> _kittenTiles = [];
  GridOptions _gridOptions = GridOptions(2, 3, 1.0, 4.0, 4.0);

  _HomeWidgetState() : super() {
    for (int i = 200; i < 1000; i += 100) {
      String imageUrl =
          "https://cka.collectiva.in/ckavideos/files/flutter/kitten/$i.jpg";
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

  void _showGridOptionsDialog() async {
    GridOptions? gridOptions = await showDialog<GridOptions>(
        context: context,
        builder: (BuildContext context) {
          return Dialog(child: CustomDialogWidget(this._gridOptions));
        });
    if (gridOptions != null) {
      setState(() {
        _gridOptions = gridOptions;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GridView"),
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        return GridView.count(
            crossAxisCount: (orientation == Orientation.portrait)
                ? _gridOptions._crossAxisCountPortrait
                : _gridOptions._crossAxisCountLandscape,
            childAspectRatio: _gridOptions._childAspectRatio,
            padding: EdgeInsets.all(_gridOptions._padding),
            mainAxisSpacing: _gridOptions._spacing,
            crossAxisSpacing: _gridOptions._spacing,
            children: _kittenTiles);
      }),
      bottomNavigationBar: Container(
          padding: const EdgeInsets.all(20.0),
          child: Text(_gridOptions.toString())),
      floatingActionButton: FloatingActionButton(
        onPressed: _showGridOptionsDialog,
        tooltip: 'Try more grid options',
        child: const Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
