import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:r1/models/cartModel.dart';
import 'package:r1/pages/item_detail_page.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/catalog.dart';
import '../themes.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.product!.length,
      itemBuilder: ((context, index) {
        final catalog = CatalogModel.product![index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ItemDetail(catalogItem: CatalogModel.product![index]),
            ),
          ),
          child: CatalogItem(catalog: catalog).pLTRB(0, 0, 0, 16),
        );
      }),
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(img: catalog.imgUrl),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.lg.color(context.accentColor).bold.make(),
                catalog.desc!.text.textStyle(context.captionStyle).make(),
                10.heightBox,
                ButtonBar(
                  buttonPadding: EdgeInsets.zero,
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    '\$${catalog.price}'.text.bold.make(),
                    AddToCartButton(catalog: catalog),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Mythemes.darkBluishColor),
                        shape: MaterialStateProperty.all(
                          StadiumBorder(),
                        ),
                      ),
                      child: 'Buy'.text.make(),
                    ),
                  ],
                ).pOnly(right: 8.0)
              ],
            ),
          ),
        ],
      ),
    ).color(context.cardColor).roundedLg.square(150).make().py(16);
  }
}

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
          AddMutation(catalog);

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
