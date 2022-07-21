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
      home: const HomePageWidget(),
    );
  }
}

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  void _showDialogC() async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return const SimpleDialog(
            title: Text('Coming soon'),
          );
        });
  }

  _show() {
    setState(() {
      _showDialogC();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          const Spacer(),
          const Center(
              child: Text(
            "Spacer",
            style: TextStyle(fontSize: 20.0),
          )),
          const Spacer(flex: 5),
          IconButton(icon: const Icon(Icons.settings), onPressed: _show),
          const Spacer(),
          IconButton(
              icon: const Icon(Icons.settings_overscan), onPressed: () => {}),
          const Spacer(),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Image.network(
                        'https://logos-download.com/wp-content/uploads/2022/01/Imec_Logo-1536x463.png'),
                    const SizedBox(height: 10.0),
                    const Text(
                      'TATA Company',
                    ),
                    const Text(
                      '''The Tata Groupis an Indian multinational conglomerate headquartered in Mumbai.[4][5] Established in 1868, it is India's largest conglomerate, with products and services in over 150 countries, and operations in 100 countries across six continents. Acknowledged as the founder of the Tata Group, Jamsetji Tata is sometimes referred to as the ‘father of Indian industry’.[6]

The group gained international recognition after acquiring several global companies.[7] Each Tata company operates independently under the guidance and supervision of its own board of directors and shareholders.[8] Philanthropic trusts control over 66% of the Tata holding company Tata Sons, while the Tata family is a very small shareholder.[9]

As of 2022, the group had an estimated annual revenue of  billion. In 2018, it contributed about 4 per cent to the country’s GDP and paid 2.24% of the total taxation in India, the highest by any corporate group.[10]

There are 29 publicly-listed Tata Group companies with a combined market capitalisation of  billion (INR 23.4 trillion) as of December 31, 2021.[11][verification needed] Significant Tata Group affiliates include Tata Consultancy Services, Tata Consumer Products, Tata Motors, Tata Power, Tata Steel, Voltas, Titan Company, Tanishq, Tata Chemicals, Tata Communications, Trent, Tata Elxsi, Indian Hotels Company, Air India, TajAir, Tata Cliq, Tata Capital, Cromā, and Tata Starbucks.[12]''',
                      maxLines: 3,
                      overflow: TextOverflow.fade,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
