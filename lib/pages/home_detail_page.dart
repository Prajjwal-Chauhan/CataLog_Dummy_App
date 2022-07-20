import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/home_widgets/add_to_cart.dart';
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
      iconTheme: IconThemeData(color: context.accentColor),
      elevation: 0.0,

      ),
      backgroundColor: context.cardColor,
      bottomNavigationBar: Container(
        color: context.canvasColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
                buttonPadding:EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.green800.bold.xl4.make(),
                  AddToCart(catalog: catalog).wh(120, 40)
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
                  color: context.canvasColor,
                    width: context.screenWidth,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment : CrossAxisAlignment.center,
                      mainAxisAlignment : MainAxisAlignment.start,
                      children: [
                        catalog.name.text.xl3.color(context.theme.buttonColor).bold.make(),
                        catalog.desc.text.textStyle(Theme.of(context).textTheme.caption!).xl.make(),
                        10.heightBox,
                        "I my nothing scarce when entrance dreaming of never was, lattice of door dreaming murmured door, gaunt soul betook press i. Visiter it before cushioned uncertain the grim, dreaming fowl opened i ah dying bust gently nodded seat. Smiling memories maiden a is grew. Peering door tapping the memories raven.".text.textStyle(Theme.of(context).textTheme.caption!).make().p16()
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