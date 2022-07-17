import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final dummyList = List.generate(50, (index) => CatalogModel.items[0]);

    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog",style: TextStyle(color:Colors.black),),
      ),
        body :Padding(
          padding: const EdgeInsets.symmetric(vertical :20.0, horizontal: 8.0),
          child: ListView.builder(
            itemCount: dummyList.length,
            itemBuilder: (context, index) {
            return ItemWidget(item: dummyList[index]);
          }),
        ),
        drawer: MyDrawer(),
      );
  }
}