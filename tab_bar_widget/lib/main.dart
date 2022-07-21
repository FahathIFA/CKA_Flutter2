import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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

class Tab1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.network(
      "http://cka.collectiva.in/ckavideos/files/flutter/tabs/ece.jpg",
    );
  }
}

class Tab2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.network(
      "http://cka.collectiva.in/ckavideos/files/flutter/tabs/68j.jpg",
    );
  }
}

class Tab3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.network(
        "http://cka.collectiva.in/ckavideos/files/flutter/tabs/ece.jpg");
  }
}

class HomeWidget extends StatelessWidget {
  HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tab Bar'),
        ),
        body: TabBarView(
          children: [Tab1(), Tab2(), Tab3()],
        ),
        bottomNavigationBar: Container(
          child: const TabBar(
              labelColor: Colors.red,
              unselectedLabelColor: Colors.grey,
              labelStyle:
                  TextStyle(color: Colors.blue, fontWeight: FontWeight.w800),
              tabs: [
                Tab(
                  text: 'Cat #1',
                  icon: Icon(Icons.arrow_left),
                ),
                Tab(
                  text: 'Cat #2',
                  icon: Icon(Icons.arrow_upward),
                ),
                Tab(
                  text: 'Cat #3',
                  icon: Icon(Icons.arrow_right),
                ),
              ]),
        ),
      ),
    );
  }
}
