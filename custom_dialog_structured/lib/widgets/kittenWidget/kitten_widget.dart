import 'package:flutter/material.dart';

class KittenBox extends StatelessWidget {
  String imageUrl;
  String kittenName;

  KittenBox({Key? key, required this.imageUrl, required this.kittenName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      header: GridTileBar(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0.5),
        title: Text(
          kittenName,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
      ),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
