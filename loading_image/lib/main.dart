import 'package:flutter/material.dart';

void main() => runApp(const LoadingImageApp());

class LoadingImageApp extends StatelessWidget {
  const LoadingImageApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomeWidget(),
    );
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  bool bright = true;

  void changeOnRefresh() {
    setState(() {
      bright = !bright;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image"),
        backgroundColor: bright ? Theme.of(context).primaryColor : Colors.red,
        actions: [
          IconButton(
            onPressed: changeOnRefresh,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Center(
        child: FadeInImage.assetNetwork(
            placeholder: 'assets/loading.gif',
            image: bright
                ? 'https://cka.collectiva.in/ckavideos/Files/Flutter/loading/1A2-F-P-I-2-C1_L.jpg'
                : "https://cka.collectiva.in/ckavideos/Files/Flutter/flowers/2018_nissan_gt-r_coupe_nismo_fq_oem_1_150.jpg"),
      ),
    );
  }
}
