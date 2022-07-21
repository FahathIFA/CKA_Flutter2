import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class Order {
  final DateTime _dt;
  final String _description;
  final double _total;

  Order(this._dt, this._description, this._total);

  double get total => _total;

  String get description => _description;

  DateTime get dt => _dt;
}

class Customer {
  final String _name;
  final String _location;
  final List<Order> _orders;

  Customer(this._name, this._location, this._orders);

  List<Order> get orders => _orders;

  String get location => _location;

  String get name => _name;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePageWidget(),
      routes: <String, WidgetBuilder>{
        '/customer': (context) =>
            const CustomerWidget(), // only simple routes work
        '/order': (context) => const OrderWidget(), // only simple routes work
      },
    );
  }
}

// ignore: must_be_immutable
class HomePageWidget extends StatelessWidget {
  final List<Customer> _customerList = [
    Customer("Bike Corp", "Atlanta", [
      Order(DateTime(2018, 11, 17), "Bicycle parts", 197.02),
      Order(DateTime(2018, 12, 1), "Bicycle parts", 107.45),
    ]),
    Customer("Trust Corp", "Atlanta", [
      Order(DateTime(2017, 1, 3), "Shredder parts", 97.02),
      Order(DateTime(2018, 3, 13), "Shredder blade", 7.45),
      Order(DateTime(2018, 5, 2), "Shredder blade", 7.45),
    ]),
    Customer("Jilly Boutique", "Birmingham", [
      Order(DateTime(2018, 1, 3), "Display unit", 97.01),
      Order(DateTime(2018, 3, 3), "Desk unit", 12.25),
      Order(DateTime(2018, 3, 21), "Clothes rack", 97.15),
    ]),
  ];

  HomePageWidget({Key? key}) : super(key: key);

  void navigateToCustomer(BuildContext context, Customer customer) {
    Navigator.pushNamed(context, "/customer",
        arguments: customer); // only simple routes work
  }

  ListTile createCustomerWidget(BuildContext context, Customer customer) {
    return ListTile(
        title: Text(customer.name),
        subtitle: Text(customer.location),
        trailing: const Icon(Icons.arrow_right),
        onTap: () => navigateToCustomer(context, customer));
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> customerList = List.from(_customerList
        .map((Customer customer) => createCustomerWidget(context, customer)));
    return Scaffold(
        appBar: AppBar(
          title: const Text("Customers"),
        ),
        body: Center(
          child: ListView(
            children: customerList,
          ),
        ));
  }
}

// ignore: must_be_immutable
class CustomerWidget extends StatelessWidget {
  const CustomerWidget({Key? key}) : super(key: key);

  void navigateToOrder(BuildContext context, Order order) {
    Navigator.pushNamed(
      context,
      "/order",
      arguments: order,
    ); // only simple routes work
  }

  ListTile createOrderWidget(BuildContext context, Order order) {
    return ListTile(
        title: Text(order.description),
        subtitle: Text("${order.dt.month}/${order.dt.day}/${order.dt.year}: "
            "\$${order.total}"),
        trailing: const Icon(Icons.arrow_right),
        onTap: () => navigateToOrder(context, order));
  }

  @override
  Widget build(BuildContext context) {
    var customer = ModalRoute.of(context)!.settings.arguments as Customer;
    List<Widget> widgetList = List.from(customer.orders
        .map((Order order) => createOrderWidget(context, order)));
    widgetList.insert(
        0,
        Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  customer.name,
                  style: const TextStyle(
                      fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  customer.location,
                  style: const TextStyle(
                      fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${customer.orders.length} orders",
                  style: const TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.bold),
                )
              ],
            )));
    return Scaffold(
        appBar: AppBar(
          title: const Text("Customers"),
        ),
        body: Center(
          child: ListView(
            children: widgetList,
          ),
        ));
  }
}

class OrderWidget extends StatelessWidget {
  const OrderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var orders = ModalRoute.of(context)!.settings.arguments as Order;

    debugPrint(orders.description);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Order Info"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: <Widget>[
              const Text("BikeCorp",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center),
              const Text("Atlanta",
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              const Text(""),
              Text(orders.description,
                  style: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              Text(
                  "${orders.dt.month}/${orders.dt.day}/${orders.dt.year} \$${orders.total}",
                  style: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center)
            ],
          ),
        ));
  }
}
