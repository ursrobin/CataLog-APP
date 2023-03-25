import 'package:flutter/material.dart';
import 'package:r1/utilities/routes.dart';
import './pages/login_page.dart';
import './pages/homepage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: MyHomepage(),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.light,
      initialRoute: '/home',
      routes: <String, WidgetBuilder>{
        '/': (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => MyHomepage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
      },
    );
  }
}
