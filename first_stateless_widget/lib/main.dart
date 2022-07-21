import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Cars'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    // List<CarWidget> cars = [];

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(children: const [
          CarWidget("Bmw", "M3",
              "https://cka.collectiva.in/ckavideos/Files/Flutter/cars/2018_bmw_m3_sedan_base_fq_oem_4_150.jpg"),
          CarWidget("Nissan", "GTR",
              "https://cka.collectiva.in/ckavideos/Files/Flutter/cars/2018_nissan_gt-r_coupe_nismo_fq_oem_1_150.jpg"),
          CarWidget("Nissan", "Sentra",
              "https://cka.collectiva.in/ckavideos/Files/Flutter/cars/2017_nissan_sentra_sedan_sr-turbo_fq_oem_4_150.jpg"),
        ]));
  }
}

class CarWidget extends StatelessWidget {
  const CarWidget(this.make, this.model, this.imageSrc, {Key? key})
      : super(key: key);

  final String make;
  final String model;
  final String imageSrc;

  @override
  Widget build(BuildContext context) {
    var carName = [];

    carName.addAll([
      Text(
        make,
        style: const TextStyle(
            color: Colors.green, fontSize: 24.0, fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        width: 10.0,
      ),
      Text(
        model,
        style: const TextStyle(
            color: Colors.blue, fontSize: 24.0, fontWeight: FontWeight.bold),
      ),
    ]);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: Colors.red,
          ),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [...carName],
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Image.network(imageSrc))
            ],
          ),
        ),
      ),
    );
  }
}
