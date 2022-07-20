import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../widgets/themes.dart';


class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            
            children: [
              Padding(padding: EdgeInsets.zero),
              "Catalog App".text.xl4.bold.color(context.theme.buttonColor).make(),
              "Chalega to chaand tak !!".text.xl2.color(context.accentColor).make(),
            ],
          );
  }
}