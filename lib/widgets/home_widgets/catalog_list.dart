import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/pages/home_detail_page.dart';
import 'package:flutter_application_1/widgets/home_widgets/add_to_cart.dart';
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
                    AddToCart(catalog: catalog)
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

