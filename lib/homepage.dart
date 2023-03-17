import 'package:flutter/material.dart';

class MyHomepage extends StatelessWidget {
  const MyHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    int time = 8;
    String name = "Robin";
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Revsion App"),
        ),
        body: Center(
          child: Text(
            "Revesion is going on it'll take $time hours \n: by $name ",
            textAlign: TextAlign.right,
          ),
        ),
        drawer: const Drawer(),
      ),
    );
  }
}
