import 'package:flutter/material.dart';
import 'package:r1/models/cartModel.dart';
import 'package:r1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

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
  final _cart = CartModel();
  // const _CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // ignore: deprecated_member_use
          '\$${_cart.totalPrice}'
              .text
              .xl4
              .color(context.theme.accentColor)
              .make(),
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

class CartList extends StatefulWidget {
  const CartList({super.key});

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  final CartModel _cart = CartModel();
  @override
  Widget build(BuildContext context) {
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
            onPressed: (() {}),
          ),
        );
      }),
    );
  }
}
