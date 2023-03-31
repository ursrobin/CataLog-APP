import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:r1/widgets/itemwidget.dart';
import 'package:r1/widgets/themes.dart';
import '../models/catalog.dart';
import '../widgets/drawer.dart';
import 'package:velocity_x/velocity_x.dart';

class MyHomepage extends StatefulWidget {
  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  // List<Item> products;
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    var catalogJason = await rootBundle.loadString('assets/files/catalog.json');
    var decodeData = jsonDecode(catalogJason);
    var productsData = decodeData["products"];
    CatalogModel.product = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mythemes.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),
              if (CatalogModel.product != null &&
                  CatalogModel.product!.isNotEmpty)
                const CatalogList().expand()
              else
                const Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        'Catalog App'.text.xl5.bold.color(Mythemes.darkBluishColor).make(),
        'Trending Products'.text.xl2.make(),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.product!.length,
      itemBuilder: ((context, index) {
        final catalog = CatalogModel.product![index];
        return CatalogItem(catalog: catalog);
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
        CatalogImage(img: catalog.imgUrl),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(Mythemes.darkBluishColor).bold.make(),
              catalog.desc!.text.textStyle(context.captionStyle).make(),
              const SizedBox(
                height: 10,
              ),
              ButtonBar(
                buttonPadding: EdgeInsets.zero,
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  '\$${catalog.price}'.text.bold.xl.make(),
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
    )).white.roundedLg.square(150).make().py(16);
  }
}

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
        .color(Mythemes.creamColor)
        .make()
        .p16()
        .w40(context);
  }
}
