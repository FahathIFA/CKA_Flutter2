// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Order {
  final DateTime _dt;
  final String _description;
  final double _total;

  Order(this._dt, this._description, this._total);

  DateTime get dt => _dt;

  String get description => _description;
  double get total => _total;
}

class Customer {
  final String _name;
  final String _location;
  final List<Order> _order;

  Customer(this._name, this._location, this._order);

  String get name => _name;
  String get location => _location;
  List<Order> get order => _order;
}

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
      home: HomePageWidget(),
    );
  }
}

class HomePageWidget extends StatelessWidget {
  final List<Customer> _customerList = [
    Customer('MotorBike Corp', 'India', [
      Order(DateTime(2022, 04, 30), 'Bike Air Filter', 440.50),
      Order(DateTime(2020, 4, 28), 'Bike Fuel Tank', 1400),
    ]),
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
    Navigator.push(context,
        MaterialPageRoute(builder: ((context) => CustomerWidget(customer))));
  }

  ListTile createCustomerWidget(BuildContext context, Customer customer) {
    return ListTile(
      title: Text(customer.name),
      subtitle: Text(customer.location),
      trailing: const Icon(Icons.arrow_right),
      onTap: () => navigateToCustomer(context, customer),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> customerList = List.from(_customerList
        .map((Customer customer) => createCustomerWidget(context, customer)));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Routes'),
      ),
      body: Center(
        child: Column(
          children: [...customerList],
        ),
      ),
    );
  }
}

class CustomerWidget extends StatelessWidget {
  final Customer _customers;
  const CustomerWidget(this._customers, {Key? key}) : super(key: key);

  void navigateToOrder(BuildContext context, Customer customer, Order order) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OrderWidget(customer, order),
        ));
  }

  ListTile createOrderListWidget(
      BuildContext context, Customer customer, Order order) {
    return ListTile(
      title: Text(order.description),
      subtitle: Text('${order.dt.month}/${order.dt.day}/${order.dt.year} : '
          '\$${order.total}'),
      trailing: const Icon(Icons.arrow_right),
      onTap: () => navigateToOrder(context, customer, order),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = List.from(_customers.order.map(
        (Order order) => createOrderListWidget(context, _customers, order)));

    widgetList.insert(
        0,
        Container(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text(
                  _customers.name,
                  style: const TextStyle(
                      fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  _customers.location,
                  style: const TextStyle(
                      fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${_customers.order.length} Orders",
                  style: const TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Detail'),
      ),
      body: Center(
          child: Column(
        children: [...widgetList],
      )),
    );
  }
}

class OrderWidget extends StatelessWidget {
  final Customer _customer;
  final Order _order;

  const OrderWidget(this._customer, this._order, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('order Detail')),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Text(_customer.name,
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center),
              Text(_customer.location,
                  style: const TextStyle(
                      fontSize: 24.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              const Text(""),
              Text(_order.description,
                  style: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              Text(
                  "${_order.dt.month}/${_order.dt.day}/${_order.dt.year}: "
                  "\$${_order.total}",
                  style: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center)
            ],
          ),
        ));
  }
}
