import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/cartModel.dart';
import '../../models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCartButton extends StatefulWidget {
  final Item catalog;
  const AddToCartButton({super.key, required this.catalog});

  @override
  State<AddToCartButton> createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  final CartModel _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalog) ? true : false;
    return IconButton(
      onPressed: () {
        CatalogModel catModel = CatalogModel();
        if (!isInCart) {
          _cart.catalog = catModel;
          _cart.addItem(widget.catalog);
          setState(() {
            isInCart = isInCart.toggle();
          });
        } else {
          _cart.removeItem(widget.catalog);
          setState(() {});
        }
      },
      icon: isInCart
          ? const Icon(CupertinoIcons.cart_badge_minus)
          : const Icon(CupertinoIcons.cart_badge_plus),
      color: isInCart ? Colors.green : Colors.black,
    );
  }
}
