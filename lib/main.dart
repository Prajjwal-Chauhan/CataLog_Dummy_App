import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/cart_page.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widgets/themes.dart';
void main(List<String> args) {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/" : (context) => HomePage(),
        MyRoutes.homeRoute : (context) => HomePage(),
        MyRoutes.loginRoute : (context) => LoginPage(),
        MyRoutes.cartRoute : (context) => CartPage()
      },
    );
  
  }
}