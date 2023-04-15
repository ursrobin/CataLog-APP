import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:r1/core/store.dart';
import 'package:r1/models/cartModel.dart';
import 'package:r1/utilities/routes.dart';
import 'package:flutter/cupertino.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return VxBuilder(
      mutations: const {AddMutation, RemoveMutation},
      builder: ((context, store, status) {
        return Stack(
          children: [
            FloatingActionButton(
              onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
              // ignore: deprecated_member_use
              backgroundColor: context.theme.buttonColor,
              child: const Icon(
                CupertinoIcons.cart,
                color: Colors.white,
              ),
            ).badge(
              count: _cart.items.length,
              color: context.canvasColor,
              size: 22,
              textStyle: TextStyle(
                color: (MediaQuery.of(context).platformBrightness ==
                        Brightness.dark)
                    ? Colors.black
                    : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        );
      }),
    );
  }
}
