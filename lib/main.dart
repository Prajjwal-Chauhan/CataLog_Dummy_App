import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_page.dart';
void main(List<String> args) {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    int days = 30;
    String name = "Prajjwal";
    return MaterialApp(
      home: HomePage()
    );
  }
}