import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/cartModel.dart';
import '../../models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCartButton extends StatelessWidget {
  final Item catalog;
  AddToCartButton({super.key, required this.catalog});

  final CartModel _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(catalog) ? true : false;
    return IconButton(
      onPressed: () {
        CatalogModel catModel = CatalogModel();
        if (!isInCart) {
          _cart.catalog = catModel;
          _cart.addItem(catalog);

          isInCart = isInCart.toggle();
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
