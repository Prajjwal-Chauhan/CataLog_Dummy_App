import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {

      static Color creamColor = Color(0xfff5f5f5);
      static Color darkcreamColor = Vx.gray900;
      static Color darkBluishColor = Color(0xff403b58);
      static Color lightBluishColor = Color.fromARGB(169, 216, 210, 246);
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        // backgroundColor: MyTheme.creamColor,
        canvasColor: Colors.white,
        shadowColor: Colors.white,
        cardColor: creamColor,
        buttonColor: darkBluishColor,
        bottomAppBarColor:darkBluishColor,
        accentColor: Colors.black,
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: AppBarTheme(
          color: MyTheme.creamColor,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          textTheme: Theme.of(context).textTheme
          // elevation: 0.0
        )
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        // primarySwatch: Colors.deepPurple,
        canvasColor: Color.fromARGB(122, 0, 0, 43),
        bottomAppBarColor: Color.fromARGB(146, 29, 23, 60),
        shadowColor: Color.fromARGB(146, 29, 23, 60),
        cardColor: darkcreamColor,
        textSelectionColor: Colors.black,
        buttonColor: lightBluishColor,
        accentColor: Vx.gray500,

        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: AppBarTheme(
          color: MyTheme.darkBluishColor,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          textTheme: Theme.of(context).textTheme
          // elevation: 0.0
        )
      );
}