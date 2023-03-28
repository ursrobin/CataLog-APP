import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/catalog.dart';
import '../widgets/drawer.dart';
import '../widgets/itemwidget.dart';

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
      appBar: AppBar(
        title: const Text("Catalog App"),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      // body: ItemWidget(item: products[0]),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child:
            (CatalogModel.product != null && CatalogModel.product!.isNotEmpty)
                ? ListView.builder(
                    itemCount: CatalogModel.product?.length,
                    itemBuilder: (context, index) {
                      return ItemWidget(item: CatalogModel.product![index]);
                    },
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
      ),
      drawer: MyDrawer(),
    );
  }
}
