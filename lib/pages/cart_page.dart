import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
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
        backgroundColor: context.theme.bottomAppBarColor,
        // backgroundColor: Colors.transparent,
        // elevation: 0.0,
      ),

      body: Column(
        children: [
          _CartList().p32().expand(),
          // Divider(),
          _CartTotal()
        ],
      ),
    );
  }
}


class _CartTotal extends StatelessWidget {

  // final _cart = CartModel();
  final CartModel _cart = (VxState.store as MyStore).cart;
  // const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        VxConsumer(
          mutations: {RemoveMutation}, 
          notifications: {},
          builder: (context,_){
            return "\$${_cart.totalPrice}".text.xl3.green800.make();
        },
        ),
        
        30.widthBox,
        ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: "Buying not supported yet...".text.make(),));
          }, 
          style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
                        // shape: MaterialStateProperty.all(StadiumBorder())
                      ),
          child: "Buy".text.color(context.theme.textSelectionColor).make()).w24(context)
        ]
      ),
    );
  }
}


class _CartList extends StatelessWidget {

  final CartModel _cart = (VxState.store as MyStore).cart;
  @override
  Widget build(BuildContext context) {
    VxState.listen(context,to: [RemoveMutation]);
    return _cart.items.isEmpty?"Nothing to show".text.xl3.makeCentered(): ListView.builder(
      itemCount: _cart.items.length,
      itemBuilder: (context,index) =>
    ListTile(
      leading: Icon(Icons.done).iconColor(context.accentColor),
      trailing: IconButton(
        icon: Icon(Icons.remove_circle_outline).iconColor(context.accentColor),
        onPressed: () {
          RemoveMutation(_cart.items[index]);
        },
        ),
        title: _cart.items[index].name.text.color(context.accentColor).make(),
    )
    );
  }
}