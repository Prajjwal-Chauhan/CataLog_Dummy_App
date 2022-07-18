import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/item_widget.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

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
      backgroundColor: MyTheme.creamColor,
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("",style: TextStyle(color: Colors.black)),
        iconTheme: IconThemeData(color: MyTheme.creamColor),
        backgroundColor: MyTheme.darkBluishColor,
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if(CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().expand()
                else
                Center(child: CircularProgressIndicator(),
                )
            ],
          ),
        ),
      ),
    );
  }
}


class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: [
              // Padding(padding: EdgeInsets.zero),
              "Catalog App".text.xl5.bold.color(MyTheme.darkBluishColor).make(),
              "Trending products".text.xl2.make(),
            ],
          );
  }
}


class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    shrinkWrap: true;
    return ListView.builder(
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
      return CatalogItem(catalog: catalog);
    },
    itemCount: CatalogModel.items.length,
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({ Key? key, required this.catalog}) :assert(catalog != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
         CatalogImage(image: catalog.image,),
         Expanded(
          child: Column(
            crossAxisAlignment : CrossAxisAlignment.start,
            mainAxisAlignment : MainAxisAlignment.center,
          children: [
            catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding:EdgeInsets.zero,
              children: [
                "\$${catalog.price}".text.color(MyTheme.darkBluishColor).bold.xl.make(),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
                    shape: MaterialStateProperty.all(StadiumBorder())
                  ),
                  child: "Buy".text.make())
              ],
            ).pOnly(right: 10.0)
          ],
         ))
        ],
      )
    ).white.rounded.square(120).make().py16();
  }
}


class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({super.key, required this.image});


  @override
  Widget build(BuildContext context) {
    return  Image.asset(
      image
      ).
      box.rounded.p8.color(MyTheme.creamColor).make().p8().w32(context);
  }
}