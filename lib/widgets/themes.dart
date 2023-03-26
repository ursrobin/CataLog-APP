import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mythemes {
  static ThemeData lightTheme(BuildContext ctx) => ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      );
  static ThemeData darkTheme(BuildContext ctx) => ThemeData(
        brightness: Brightness.dark,
      );
}
