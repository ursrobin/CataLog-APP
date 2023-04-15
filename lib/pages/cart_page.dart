import 'package:flutter/material.dart';

import 'package:r1/models/cartModel.dart';

import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';

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
      body: Column(
        children: [
          CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CartModel _cart = (VxState.store as MyStore).cart;

    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // ignore: deprecated_member_use
          VxConsumer(
              builder: (context, obj, status) {
                return '\$${_cart.totalPrice}'
                    .text
                    .xl4
                    // ignore: deprecated_member_use
                    .color(context.theme.accentColor)
                    .make();
              },
              mutations: const {RemoveMutation}),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Buy option is not available yet'),
                ),
              );
            },
            style: ButtonStyle(
              backgroundColor:
                  // ignore: deprecated_member_use
                  MaterialStateProperty.all(context.theme.buttonColor),
            ),
            child: 'Buy'.text.make(),
          )
        ],
      ),
    );
  }
}

class CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    CartModel _cart = (VxState.store as MyStore).cart;
    return ListView.builder(
      itemCount: _cart.items.length,
      itemBuilder: ((context, index) {
        return ListTile(
          leading: const Icon(
            Icons.done,
          ),
          title: _cart.items[index].name.text.make(),
          trailing: IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            onPressed: (() {
              RemoveMutation(_cart.items[index]);
            }),
          ),
        );
      }),
    );
  }
}
