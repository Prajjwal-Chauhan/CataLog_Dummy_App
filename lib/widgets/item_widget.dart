// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';

class ItemWidget extends StatelessWidget {

  final Item item;

  const ItemWidget({Key? key, required this.item}) : 
  assert (item != null),
  super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.deepPurple,
      child: ListTile(
        onTap: () {
          print("${item.name} pressed");
        },
        leading: Image.asset(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text("\$${item.price}",
          textScaleFactor:1.2,
        style: TextStyle(
          color: Colors.deepPurple,
          fontWeight: FontWeight.bold,
          // backgroundColor: Colors.deepPurpleAccent,
        ),
        ),
      ),
    );
  }
}