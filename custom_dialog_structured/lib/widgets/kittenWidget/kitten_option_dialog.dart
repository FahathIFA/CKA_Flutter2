import 'package:custom_dialog_structured/bo/kitten_screnn_option.dart';
import 'package:flutter/material.dart';

class KittenOptionDialog extends StatefulWidget {
  final KittenScreenOption _kittenScreenOption;
  const KittenOptionDialog(this._kittenScreenOption, {Key? key})
      : super(key: key);

  @override
  State<KittenOptionDialog> createState() =>
      _KittenOptionDialogState(_kittenScreenOption);
}

class _KittenOptionDialogState extends State<KittenOptionDialog> {
  final KittenScreenOption _kittenScreenOption;
  _KittenOptionDialogState(this._kittenScreenOption);
  @override
  Widget build(BuildContext context) {
    var countAxis = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        const Text(
          'Cross Axis Count',
        ),
        const Spacer(),
        DropdownButton<int>(
            value: _kittenScreenOption.crossAxisCount,
            items: <int>[1, 2, 3, 4, 5, 6].map((value) {
              return DropdownMenuItem(
                value: value,
                child: Text(
                  value.toString(),
                ),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                _kittenScreenOption.crossAxisCount = newValue!;
              });
            }),
        const Spacer(),
      ],
    );

    var mainSpacing = Row(
      children: [
        const Spacer(),
        const Text('Spacing'),
        const Spacer(),
        DropdownButton<double>(
            value: _kittenScreenOption.mainAxisSpacing,
            items: [1.0, 2.0, 4.0, 8.0, 16.0, 32.0].map((value) {
              return DropdownMenuItem<double>(
                  value: value,
                  child: Text(
                    value.toString(),
                  ));
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                _kittenScreenOption.crossAxisSpacing = newValue!;
              });
            }),
        const Spacer(),
      ],
    );
    var aspectRatio = Row(
      children: [
        const Spacer(),
        const Text('Aspect Ratio'),
        const Spacer(),
        DropdownButton<double>(
            value: _kittenScreenOption.childAspectRatio,
            items: <double>[1.0, 1.5, 2.0, 2.5].map((value) {
              return DropdownMenuItem<double>(
                  value: value,
                  child: Text(
                    value.toString(),
                  ));
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                _kittenScreenOption.childAspectRatio = newValue!;
              });
            }),
        const Spacer(),
      ],
    );

    var paddings =
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      const Spacer(),
      const Text("Padding"),
      const Spacer(),
      DropdownButton<double>(
        value: _kittenScreenOption.padding,
        items: <double>[1.0, 2.0, 4.0, 8.0, 16.0, 32.0].map((double value) {
          return DropdownMenuItem<double>(
            value: value,
            child: Text(value.toString()),
          );
        }).toList(),
        onChanged: (newValue) {
          setState(() {
            _kittenScreenOption.padding = newValue!;
          });
        },
      ),
      const Spacer(),
    ]);
    return Container(
      padding: const EdgeInsets.all(12.5),
      height: 300.0,
      child: Column(
        children: [
          const Text(
            'Dialog Option',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          countAxis,
          mainSpacing,
          aspectRatio,
          paddings,
          TextButton(
              onPressed: () {
                Navigator.pop(context, _kittenScreenOption);
              },
              child: const Text('Apply'))
        ],
      ),
    );
  }
}
