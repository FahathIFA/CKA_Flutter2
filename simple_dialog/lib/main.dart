import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Dialog',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeWidget(title: 'Simple Dialog'),
    );
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  BoxFit _boxfit = BoxFit.cover;

  void _showDialogOption() async {
    BoxFit? boxFit = await showDialog<BoxFit>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(title: const Text('Select Option'), children: [
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, BoxFit.cover);
              },
              child: const Text('Cover'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, BoxFit.contain);
              },
              child: const Text('Contain'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, BoxFit.fill);
              },
              child: const Text('Fill'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, BoxFit.fitHeight);
              },
              child: const Text('Fit Height'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, BoxFit.fitWidth);
              },
              child: const Text('Fit Width'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, BoxFit.scaleDown);
              },
              child: const Text('Scale Down'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, BoxFit.none);
              },
              child: const Text('None'),
            ),
          ]);
        });

    if (boxFit != null) {
      setState(() {
        _boxfit = boxFit;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> kittenTiles = [];

    for (int i = 200; i < 1000; i += 100) {
      String imageUrl =
          "https://cka.collectiva.in/ckavideos/files/flutter/kitten/$i.jpg";
      kittenTiles.add(
        GridTile(
          child: Image.network(
            imageUrl,
            fit: _boxfit,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        return GridView.count(
          crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
          crossAxisSpacing: 1.0,
          mainAxisSpacing: 1.0,
          children: [...kittenTiles],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: _showDialogOption,
        child: const Icon(Icons.select_all),
      ),
    );
  }
}
