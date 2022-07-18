import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../widgets/themes.dart';


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