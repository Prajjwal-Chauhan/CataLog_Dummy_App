import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/pages/home_detail_page.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'catalog_image.dart';


class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    shrinkWrap: true;
    return ListView.builder(
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
      return InkWell(
        onTap: () => Navigator.push(
          context,MaterialPageRoute(
            builder: (context) => HomeDetailPage(
              catalog: catalog),
              ),
            ),
        child: CatalogItem(catalog: catalog),
        );
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
         Hero(
          tag: Key(catalog.id.toString()),
          child: CatalogImage(image: catalog.image,),
          ),
         Expanded(
            child: SingleChildScrollView(
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
                    _addToCart(catalog: catalog)
                  ],
                ).pOnly(right: 10.0)
              ],
                     ),
            ),
          
          )
        ],
      )
    ).white.rounded.square(120).make().py16();
  }
}

class _addToCart extends StatefulWidget {

  final Item catalog;
  
  const _addToCart({ Key? key, required this.catalog,}) : super(key: key);

  @override
  State<_addToCart> createState() => _addToCartState();
}

class _addToCartState extends State<_addToCart> {

  bool  isAdded = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        isAdded = isAdded.toggle();
        final _catalog = CatalogModel();
        final _cart = CartModel();
        _cart.catalog = _catalog;
        _cart.add(widget.catalog);

        setState(() {
          
        });
      },
      style: isAdded?ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.green[800]),
        shape: MaterialStateProperty.all(StadiumBorder())
      ):ButtonStyle(
        backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
        shape: MaterialStateProperty.all(StadiumBorder())
      ),
      child: isAdded?Icon(Icons.done):"Add to Cart".text.make()
      );
  }
}