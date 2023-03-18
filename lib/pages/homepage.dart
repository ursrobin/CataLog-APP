import 'package:flutter/material.dart';

class MyHomepage extends StatelessWidget {
  const MyHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    int time = 8;
    String name = "Robin";
    return Scaffold(
      appBar: AppBar(
        title: const Text("Revsion App"),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: Center(
        child: Text(
          "Revesion is going on it'll take $time hours \n: by $name ",
          textAlign: TextAlign.right,
          style: const TextStyle(
            color: Color.fromARGB(255, 5, 13, 255),
            fontSize: 20,
          ),
        ),
      ),
      drawer: const Drawer(),
    );
  }
}
