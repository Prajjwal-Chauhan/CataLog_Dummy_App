import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {

    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");

    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items =  List.from(productsData).map<Item>((item) => Item.fromMap(item)).toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(50, (index) => CatalogModel.items[0]);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Catalog",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)? 
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15
            ),
          itemBuilder: (context,index){
            final item = CatalogModel.items[index];
            return Card(
              clipBehavior: Clip.antiAlias,
              shape : RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: GridTile(
                header: Container(
                  child: Text(item.name,
                  style: TextStyle(
                    color: Colors.white
                  ),),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(146, 104, 58, 183)
                  ),
                  ),
                child: Image.asset(item.image),
                footer: Container(
                  child: Text("\$"+item.price.toString(),
                  style: TextStyle(
                    color: Colors.white
                  ),),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.black26
                  ),
                  ) 
                )
                );
          },
          itemCount: CatalogModel.items.length,
          )
            : Center(
              child: CircularProgressIndicator(),
            )
      ),
      drawer: MyDrawer(),
    );
  }
}
