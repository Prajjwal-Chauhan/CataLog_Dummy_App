import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // floatingActionButton:Icon(CupertinoIcons.cart),
      appBar: AppBar(
        // leading: Icon(CupertinoIcons.cart),
        title: Text("Cart",style: TextStyle(color: MyTheme.creamColor)),
        iconTheme: IconThemeData(color: MyTheme.creamColor),
        backgroundColor: MyTheme.darkBluishColor,
        // backgroundColor: Colors.transparent,
        // elevation: 0.0,
      ),

      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal()
        ],
      ),
    );
  }
}


class _CartTotal extends StatelessWidget {

  final _cart = CartModel();
  // const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        "\$${_cart.totalPrice}".text.xl3.green800.make(),
        30.widthBox,
        ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: "Buying not supported yet...".text.make(),));
          }, 
          style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
                        shape: MaterialStateProperty.all(StadiumBorder())
                      ),
          child: "Buy".text.color(MyTheme.creamColor).make()).w24(context)
        ]
      ),
    );
  }
}


class _CartList extends StatefulWidget {
  const _CartList({Key? key}) : super(key: key);

  @override
  State<_CartList> createState() => __CartListState();
}

class __CartListState extends State<_CartList> {

  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty?"Nothing to show".text.xl3.makeCentered(): ListView.builder(
      itemCount: _cart.items.length,
      itemBuilder: (context,index) =>
    ListTile(
      leading: Icon(Icons.done),
      trailing: IconButton(
        icon: Icon(Icons.remove_circle_outline),
        onPressed: () {
          _cart.remove(_cart.items[index]);
          setState(() {});
        },
        ),
        title: _cart.items[index].name.text.sm.make(),
    )
    );
  }
}