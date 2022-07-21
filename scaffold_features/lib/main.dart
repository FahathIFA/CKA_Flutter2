import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text("AppBar"),
          actions: [
            IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  debugPrint("Add IconButton Pressed...");
                })
          ],
        ),
        backgroundColor: Colors.lightBlueAccent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Body',
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (index) => debugPrint("Bottom Navigation Bar onTap: $index"),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Bottom Nav Bar Item 1',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mail),
              label: 'Bottom Nav Bar Item 2',
            ),
          ],
        ),
        bottomSheet: Container(
          color: Colors.amberAccent,
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: <Widget>[
              IconButton(
                  icon: const Icon(Icons.update),
                  onPressed: () {
                    debugPrint("Bottom Sheet Icon Pressed");
                  }),
              const Text('Bottom Sheet Text')
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              Row(children: [
                IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      debugPrint("Drawer Item 1 Pressed");
                    }),
                const Text('Drawer Item 1')
              ]),
              Row(
                children: [
                  IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        debugPrint("Drawer Item 2 Pressed");
                      }),
                  const Text('Drawer Item 2')
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              debugPrint("FloatingActionButton Pressed");
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add)),
        persistentFooterButtons: [
          IconButton(
              icon: const Icon(Icons.update),
              onPressed: () {
                debugPrint("Persistant Footer Icon Pressed");
              }),
          const Text('Persistant Footer Text')
        ]);
  }
}
