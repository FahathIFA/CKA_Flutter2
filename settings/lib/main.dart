import 'package:flutter/material.dart';

void main() => runApp(const ListViewListTile());

class ListViewListTile extends StatelessWidget {
  const ListViewListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'list tile',
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: const HomeWidget(
        title: 'ListView ListTile',
      ),
    );
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int _selectedIndex = 0;

  static const textStyleNormal = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.normal, color: Colors.black);
  static const textStyleSelected = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black);

  select(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  TextFormField accessibilityFormText = TextFormField(
    decoration: const InputDecoration(
        icon: Icon(Icons.format_size),
        labelText: 'Font Size',
        hintText: 'size'),
  );
  TextFormField historyFormText = TextFormField(
    decoration: const InputDecoration(
        icon: Icon(Icons.history), labelText: 'History', hintText: 'size'),
  );
  TextFormField languageFormText = TextFormField(
    decoration: const InputDecoration(
        icon: Icon(Icons.language), labelText: 'Language', hintText: 'size'),
  );
  TextFormField displayFormText = TextFormField(
    decoration: const InputDecoration(
        icon: Icon(Icons.language),
        labelText: 'Enter Color',
        hintText: 'Color '),
  );

  @override
  Widget build(BuildContext context) {
    final accessibilityListTile = ListTile(
      leading: const Icon(Icons.accessibility),
      title: Text('Accessibility',
          style: _selectedIndex == 0 ? textStyleSelected : textStyleNormal),
      subtitle: const Text('Accessibility Setting'),
      trailing: const Icon(Icons.settings),
      onTap: () => select(0),
    );
    ListTile historyListTile = ListTile(
      leading: const Icon(Icons.history),
      title: Text('History',
          style: _selectedIndex == 1 ? textStyleSelected : textStyleNormal),
      subtitle: const Text('History Setting'),
      trailing: const Icon(Icons.settings),
      onTap: () => select(1),
    );
    ListTile languageListTile = ListTile(
      leading: const Icon(Icons.language),
      title: Text('Language',
          style: _selectedIndex == 2 ? textStyleSelected : textStyleNormal),
      subtitle: const Text('Language Setting'),
      trailing: const Icon(Icons.settings),
      onTap: () => select(2),
    );
    ListTile displayListTile = ListTile(
      leading: const Icon(Icons.display_settings),
      title: Text('Display',
          style: _selectedIndex == 3 ? textStyleSelected : textStyleNormal),
      subtitle: const Text('Language Setting'),
      trailing: const Icon(Icons.settings),
      onTap: () => select(3),
    );

    var selectionBottomSheet = _selectedIndex == 0
        ? accessibilityFormText
        : _selectedIndex == 1
            ? historyFormText
            : _selectedIndex == 2
                ? languageFormText
                : displayFormText;

    var selectionTitle = _selectedIndex == 0
        ? 'Accessibility'
        : _selectedIndex == 1
            ? 'History'
            : _selectedIndex == 2
                ? 'Language'
                : 'Display';

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(children: [
        accessibilityListTile,
        historyListTile,
        languageListTile,
        displayListTile
      ]),
      bottomSheet: Container(
        // height: 200.0,
        color: const Color.fromARGB(255, 193, 238, 238),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            // height: 200.0,
            constraints: BoxConstraints(maxHeight: 200),
            child: Column(
              children: [
                const Icon(Icons.settings),
                Text('$selectionTitle Settings'),
                selectionBottomSheet
              ],
            ),
          ),
        ),
      ),
    );
  }
}
