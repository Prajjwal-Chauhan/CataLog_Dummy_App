import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog",style: TextStyle(color:Colors.black),),
      ),
        body :Center(
          child :Container(
            child: Text("This is my first flutter application"),
        ),
        ),
        drawer: MyDrawer(),
      );
  }
}