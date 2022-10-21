import 'package:flutter/material.dart';

import 'manufacturer.dart';
import 'buyer.dart';
import 'wholesaler.dart';
import 'about_gst.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gst Calculation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  List<Widget> lstWidget = [
    const MyBuyers(),
    const Manufacturer(),
    const Wholesaler(),
    const AboutGst(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Gst Calculater",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SafeArea(child: Center(child: lstWidget.elementAt(selectedIndex))),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.orangeAccent,
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          //print('btm-$value');
          setState(() {
            selectedIndex = value;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: "Buyers",
            icon: Icon(Icons.people),
          ),
          BottomNavigationBarItem(
            label: "Manufucturer",
            icon: Icon(Icons.settings),
          ),
          BottomNavigationBarItem(
            label: "Wholesaler/Retailer",
            icon: Icon(Icons.local_shipping),
          ),
          BottomNavigationBarItem(
            label: "About GST",
            icon: Icon(Icons.info),
          ),
        ],
      ),
    );
  }
}
