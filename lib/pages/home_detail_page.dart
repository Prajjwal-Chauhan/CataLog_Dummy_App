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
      appBar: AppBar(),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
                buttonPadding:EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.color(MyTheme.darkBluishColor).bold.xl4.make(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
                      shape: MaterialStateProperty.all(StadiumBorder())
                    ),
                    child: "Buy".text.make()
                    ).wh(100, 40)
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
                  child: Column(
                    crossAxisAlignment : CrossAxisAlignment.center,
                    mainAxisAlignment : MainAxisAlignment.start,
                    children: [
                      catalog.name.text.xl3.color(MyTheme.darkBluishColor).bold.make(),
                      catalog.desc.text.textStyle(context.captionStyle).xl.make(),
                      10.heightBox,
                    ],
                  ).py64(),
                ),
              )
              )
            ]
          ), 
        ),
      
    );
  }
}