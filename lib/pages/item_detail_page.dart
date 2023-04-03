import 'package:flutter/material.dart';
import 'package:r1/models/catalog.dart';
import 'package:r1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class ItemDetail extends StatelessWidget {
  final Item catalogItem;

  const ItemDetail({super.key, required this.catalogItem});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          buttonPadding: EdgeInsets.zero,
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            '\$${catalogItem.price}'.text.bold.xl4.red800.make(),
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
            ).wh(100, 50),
          ],
        ).p32(),
      ),
      backgroundColor: Mythemes.creamColor,
      body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Hero(
                tag: Key(catalogItem.id.toString()),
                child: Image.network(catalogItem.imgUrl),
              ).h32(context),
              Expanded(
                child: VxArc(
                  height: 30,
                  edge: VxEdge.TOP,
                  arcType: VxArcType.CONVEY,
                  child: Container(
                    width: context.screenWidth,
                    color: Colors.white,
                    child: Column(
                      children: [
                        catalogItem.name.text.xl4
                            .color(Mythemes.darkBluishColor)
                            .bold
                            .make(),
                        catalogItem.desc!.text
                            .textStyle(context.captionStyle)
                            .xl
                            .make(),
                        "Dolor occaecat reprehenderit anim et amet consequat amet eiusmod labore.Lorem non ipsum do nostrud adipisicing veniam incididunt pariatur aute."
                            .text
                            .textStyle(context.captionStyle)
                            .make()
                            .centered()
                            .p16(),
                      ],
                    ).py64(),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
