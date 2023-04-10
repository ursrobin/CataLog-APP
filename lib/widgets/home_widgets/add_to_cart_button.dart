import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:r1/core/store.dart';
import '../../models/cartModel.dart';
import '../../models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCartButton extends StatelessWidget {
  final Item catalog;
  AddToCartButton({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation]);
    CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catalog) ? true : false;
    return IconButton(
      onPressed: () {
        if (!isInCart) {
          AddMutation(catalog);
        } else {
          _cart.removeItem(catalog);
        }
      },
      icon: isInCart
          ? const Icon(CupertinoIcons.cart_badge_minus)
          : const Icon(CupertinoIcons.cart_badge_plus),
      color: isInCart ? Colors.green : Colors.black,
    );
  }
}
