import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  final String img;

  const CatalogImage({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return Image.network(img)
        .box
        .rounded
        .p8
        .p16
        .color(context.canvasColor)
        .make()
        .p16()
        .w40(context);
  }
}
