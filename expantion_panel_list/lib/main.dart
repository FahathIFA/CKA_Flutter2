import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class ExpansionPanelData {
  final String _title;
  final String _body;
  bool _expanded;

  ExpansionPanelData(this._title, this._body, this._expanded);

  String get title => _title;

  @override
  String toString() {
    return 'ExpansionPanelData{_title: $_title, _body: $_body, _expanded: $_expanded}';
  }

  String get body => _body;

  bool get expanded => _expanded;

  set expanded(bool value) {
    _expanded = value;
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: HomeWidget(),
        showPerformanceOverlay: true);
  }
}

class HomeWidget extends StatefulWidget {
  @override
  // ignore: no_logic_in_create_state
  _HomeWidgetState createState() => _HomeWidgetState([
        ExpansionPanelData(
            "Can I backup my data?",
            "dsfuysdiu fudsy fiusdyf "
                "usdyf iudsyf udsyfiuysd ufyuisdyfi sduiyfiusdyf dsyui u",
            false),
        ExpansionPanelData(
            "How can I increase my space?",
            "sydufy "
                "dsuiyfuidysu fusyufsdyuif ysudiy fuydsufy suyf udsy fu",
            false),
        ExpansionPanelData(
            "How do I cancel?",
            "ddsufysd yfds fsduyf sdyf "
                "sudyuy fsudyf sydyf dsy fdsuyf udsufy udsyfdsfyuysdf uyud",
            false),
        ExpansionPanelData(
            "How do I change language?",
            "udsuf sdifuu fdsuif "
                "uf dsufdisu fius wewqw qeqweqwyiquuiqweqwewqe weewe wewe",
            false),
        ExpansionPanelData(
            "How do I search?",
            "ooioio ioi oio i odsfudsifsdf"
                " dfdsfdsui idufu dsiuf isduf iduf idsu fisduf iusidf ",
            false),
        ExpansionPanelData(
            "How do I view on other devices?",
            "idusdf isu "
                "idsu idsu fisduf usyfuedy ewuyduyed uyeu dyeudy uweyu",
            false),
        ExpansionPanelData(
            "How do I view my history",
            "iirewy syfudy fu "
                "yfsduyfds yfdsuyf udsfydsufy sduyf dsuyf udsyf udsyuee",
            false),
        ExpansionPanelData(
            "Is my subscription cost going to go up?",
            "wieureiy dys udsyyf "
                "dsufy dusyfudsy fuysdu udsyuyfudsyfuewyrwreooioou  uiy",
            false),
      ]);
}

class _HomeWidgetState extends State<HomeWidget> {
  // Track expansion panels, including expanded true/false;
  final List<ExpansionPanelData> _expansionPanelData;

  _HomeWidgetState(this._expansionPanelData);

  _onExpansion(int panelIndex, bool isExpanded) {
    // Toggle the expanded state. Using setState will force 'build' to fire.
    setState(() {
      _expansionPanelData[panelIndex].expanded =
          !(_expansionPanelData[panelIndex].expanded);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Build the expansion panels from scratch every time the ui builds.
    // This is not as expensive as it sounds.
    List<ExpansionPanel> expansionPanels = [];
    for (int i = 0, ii = _expansionPanelData.length; i < ii; i++) {
      var expansionPanelData = _expansionPanelData[i];
      expansionPanels.add(ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(expansionPanelData.title,
                    style: const TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold)));
          },
          body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(expansionPanelData.body,
                  style: const TextStyle(
                      fontSize: 16.0, fontStyle: FontStyle.italic))),
          isExpanded: expansionPanelData.expanded));
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text("FAQs"),
        ),
        body: SingleChildScrollView(
            child: Container(
          margin: const EdgeInsets.all(24.0),
          child: ExpansionPanelList(
            children: expansionPanels,
            expansionCallback: _onExpansion,
          ),
        )));
  }
}
