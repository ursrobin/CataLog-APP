import 'package:flutter/material.dart';
import 'package:r1/pages/cart_page.dart';
import 'package:r1/utilities/routes.dart';
import 'package:r1/widgets/themes.dart';
import './pages/login_page.dart';
import './pages/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Mythemes.lightTheme(context),
      darkTheme: Mythemes.darkTheme(context),
      themeMode: ThemeMode.system,
      initialRoute: '/home',
      routes: <String, WidgetBuilder>{
        '/': (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => MyHomepage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => MyCart(),
      },
    );
  }
}
