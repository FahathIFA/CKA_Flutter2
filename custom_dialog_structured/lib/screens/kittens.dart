import 'package:custom_dialog_structured/bo/kitten_screnn_option.dart';
import 'package:custom_dialog_structured/widgets/kittenWidget/kitten_option_dialog.dart';
import 'package:flutter/material.dart';

import '../widgets/kittenWidget/kitten_widget.dart';

class Kittens extends StatefulWidget {
  const Kittens({Key? key}) : super(key: key);

  @override
  State<Kittens> createState() => _KittensState();
}

class _KittensState extends State<Kittens> {
  var _kittenScreenOption = KittenScreenOption(2, 1.0, 1.0, 2.0, 1.0);
  _showDialogOption() async {
    var res = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: KittenOptionDialog(_kittenScreenOption),
          );
        });
    if (res != null) {
      setState(() {
        _kittenScreenOption = res;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var kittens = <KittenBox>[];
    for (var i = 200; i < 1000; i += 100) {
      kittens.add(KittenBox(
          imageUrl:
              'https://cka.collectiva.in/ckavideos/files/flutter/kitten/$i.jpg',
          kittenName: 'kitty $i'));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kittens dialog'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return GridView.count(
            crossAxisCount: _kittenScreenOption.crossAxisCount,
            mainAxisSpacing: _kittenScreenOption.mainAxisSpacing,
            crossAxisSpacing: _kittenScreenOption.crossAxisSpacing,
            padding: EdgeInsets.all(_kittenScreenOption.padding),
            childAspectRatio: _kittenScreenOption.childAspectRatio,
            children: [...kittens],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showDialogOption,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
