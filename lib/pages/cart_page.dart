import 'package:flutter/material.dart';
import 'package:r1/widgets/themes.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Cart'),
      ),
    );
  }
}
