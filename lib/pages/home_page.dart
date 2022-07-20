import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'dart:convert';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_application_1/widgets/home_widgets/catalog_list.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    // final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";
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

    //     final response = await http.get(Uri.parse(url));
    // final catalogJson = response.body;

    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items =  List.from(productsData).map<Item>((item) => Item.fromMap(item)).toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(50, (index) => CatalogModel.items[0]);
    final _cart = (VxState.store as MyStore).cart;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation,RemoveMutation},
        builder: (context,store,_)=> 
        FloatingActionButton(
          
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          backgroundColor: context.theme.buttonColor,
          child: Icon(CupertinoIcons.cart),
        ).badge(color: context.theme.textSelectionColor,size: 20,count: _cart.items.length,textStyle: TextStyle(
          color: context.theme.buttonColor,
          fontWeight: FontWeight.bold,
          fontSize: 11,
        ))
        
      ),
      backgroundColor: context.cardColor,
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Trending products",style: TextStyle(color: MyTheme.creamColor)),
        iconTheme: IconThemeData(color: MyTheme.creamColor),
        backgroundColor: context.theme.bottomAppBarColor,
        // backgroundColor: Colors.transparent,
        // elevation: 0.0,
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.mH12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if(CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().py20().expand()
                else CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
