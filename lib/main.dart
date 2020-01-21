import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './pages/Constants.dart';
import './pages/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Decimal Newz",
        debugShowCheckedModeBanner: false,
        home: HomePage(),
    );
  }

}