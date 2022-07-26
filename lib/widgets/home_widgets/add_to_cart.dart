import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {

        final Item catalog;
  
   AddToCart({ Key? key, required this.catalog,}) : super(key: key);

  @override

        // final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    VxState.watch(context,on: [AddMutation,RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;

  bool  isInCart = _cart.items.contains(catalog)? true: false;
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
        AddMutation(catalog);

        // setState(() {});
        }
      },
      style: isInCart?ButtonStyle(
        backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
        shape: MaterialStateProperty.all(StadiumBorder())
      ):ButtonStyle(
        backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
        shape: MaterialStateProperty.all(StadiumBorder())
      ),
      child: isInCart?Icon(Icons.done).iconColor(context.theme.textSelectionColor):Icon(CupertinoIcons.cart_badge_plus).iconColor(context.theme.textSelectionColor)
      );
  }
}