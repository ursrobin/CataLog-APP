import 'package:flutter/material.dart';
import '../models/catalog.dart';
import '../widgets/drawer.dart';
import '../widgets/itemwidget.dart';

class MyHomepage extends StatelessWidget {
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
      body: ListView.builder(
        padding: const EdgeInsets.all(14),
        itemCount: CatalogModel.product.length,
        itemBuilder: (context, index) {
          return ItemWidget(item: CatalogModel.product[index]);
        },
      ),
      drawer: MyDrawer(),
    );
  }
}
