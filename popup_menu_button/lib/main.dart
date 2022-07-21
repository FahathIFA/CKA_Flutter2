import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

enum PopupMenuActions { add1, add10, add50, add100, exit }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeWidget(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomeWidget extends StatefulWidget {
  HomeWidget({Key? key, required this.title}) : super(key: key);

  String title;

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int _counter = 0;

  void _increment(int by) {
    setState(() {
      _counter += by;
    });
  }

  void _onPopupSelected(PopupMenuActions item) {
    if (PopupMenuActions.exit == item) {
      // SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    } else {
      _increment(PopupMenuActions.add1 == item
          ? 1
          : PopupMenuActions.add10 == item
              ? 10
              : PopupMenuActions.add50 == item
                  ? 50
                  : 100);
    }
  }

  // Future<bool?> _showDialogAlert() async {
  //   await showDialog<bool>(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: const Text('Alert Dialog'),
  //           content: const Text('Are sure want to delete'),
  //           actions: [
  //             TextButton(
  //               onPressed: () => Navigator.pop(context, true),
  //               child: const Text('Yes'),
  //             ),
  //             TextButton(
  //               onPressed: () => Navigator.pop(context, false),
  //               child: const Text('No'),
  //             ),
  //           ],
  //         );
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          PopupMenuButton<PopupMenuActions>(
            onSelected: _onPopupSelected,
            itemBuilder: (BuildContext context) =>
                <PopupMenuEntry<PopupMenuActions>>[
              const PopupMenuItem<PopupMenuActions>(
                value: PopupMenuActions.add1,
                child: Text('+1'),
              ),
              const PopupMenuItem(
                value: PopupMenuActions.add10,
                child: Text('+10'),
              ),
              const PopupMenuItem(
                value: PopupMenuActions.add50,
                child: Text('+50'),
              ),
              const PopupMenuItem(
                value: PopupMenuActions.add100,
                child: Text('+100'),
              ),
              const PopupMenuDivider(),
              PopupMenuItem(
                value: PopupMenuActions.exit,
                child: const Text('Exit'),
              )
            ],
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
