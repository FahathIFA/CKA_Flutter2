import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class Square {
  final String _text;
  final Color _color;

  Square(this._text, this._color);

  @override
  operator ==(other) =>
      (other is Square) && (_text == other._text) && (_color == other._color);

  @override
  int get hashCode => _text.hashCode ^ _color.hashCode;
  Color get color => _color;
  String get text => _text;
}

class Bloc {
  // BLoC stands for Business Logic Component.
  final _random = Random();
  List<Square> _squareList = [];

  Bloc() {
    _addActionStreamController.stream.listen(_handleAdd);
  }

  int next(int min, int max) => min + _random.nextInt(max - min);

  List<Square> initSquareList() {
    _squareList = [Square("Square 1", Colors.red)];
    return _squareList;
  }

  void dispose() {
    _addActionStreamController.close();
  }

  Square createSquare() {
    String nextSquareNumberAsString = (_squareList.length + 1).toString();
    return Square("Square $nextSquareNumberAsString",
        Color.fromRGBO(next(0, 255), next(0, 255), next(0, 255), 0.5));
  }

  void _handleAdd(void v) {
    _squareList.add(createSquare());
    _squareListSubject.add(_squareList);
  }

  // Streams for State Updates
  Stream<List<Square>> get squareListStream => _squareListSubject.stream;
  final _squareListSubject = BehaviorSubject<List<Square>>();

  // Sinks for Actions
  Sink get addAction => _addActionStreamController.sink;
  final _addActionStreamController = StreamController();
}

class BlocProvider extends InheritedWidget {
  final Bloc bloc;

  const BlocProvider({
    Key? key,
    required this.bloc,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static Bloc of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<BlocProvider>())!.bloc;
}

void main() => runApp(NestedBuildersAppWidget());

class NestedBuildersAppWidget extends StatelessWidget {
  final Bloc _bloc = Bloc();

  NestedBuildersAppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nested Builders',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        bloc: _bloc,
        child: HomeWidget(title: 'Nested Builders'),
      ),
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        // actions: [],
      ),
      body: StreamBuilder<List<Square>>(
          stream: bloc.squareListStream,
          initialData: bloc.initSquareList(),
          builder: (context, snapshot) {
            List<Square>? squares = snapshot.data;
            return OrientationBuilder(builder: (context, orientation) {
              return GridView.builder(
                  itemCount: squares!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          (orientation == Orientation.portrait) ? 3 : 4),
                  itemBuilder: (BuildContext context, int index) {
                    return GridTile(
                      child: Container(
                        color: squares[index].color,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(squares[index]._text,
                              style: const TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center),
                        ),
                      ),
                    );
                  });
            });
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => bloc.addAction.add(null),
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
