import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({super.key, required this.catalog}) : assert(catalog!=null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,

      ),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
                buttonPadding:EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.green800.bold.xl4.make(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
                      shape: MaterialStateProperty.all(StadiumBorder())
                    ),
                    child: "Add to cart".text.make()
                    ).wh(120, 40)
                ],
        ).p32(),
      ),
      body: SafeArea(
        bottom : false,
          child: Column(
            children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.asset(catalog.image)
              ).h32(context),
              Expanded(child: 
              VxArc(
                height: 25.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: Colors.white,
                    width: context.screenWidth,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment : CrossAxisAlignment.center,
                      mainAxisAlignment : MainAxisAlignment.start,
                      children: [
                        catalog.name.text.xl3.color(MyTheme.darkBluishColor).bold.make(),
                        catalog.desc.text.textStyle(context.captionStyle).xl.make(),
                        10.heightBox,
                        "I my nothing scarce when entrance dreaming of never was, lattice of door dreaming murmured door, gaunt soul betook press i. Visiter it before cushioned uncertain the grim, dreaming fowl opened i ah dying bust gently nodded seat. Smiling memories maiden a is grew. Peering door tapping the memories raven.".text.textStyle(context.captionStyle).make().p16()
                      ],
                    ).py64(),
                  ),
                ),
              )
              )
            ]
          ), 
        ),
      
    );
  }
}