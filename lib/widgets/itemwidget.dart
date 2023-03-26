import 'package:flutter/material.dart';
import '../models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;
  const ItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: ListTile(
        onTap: () {
          print('Tapped on item ${item.id.toString()}');
        },
        leading: Image.network(item.imgUrl),
        title: Text(item.name),
        subtitle: Text(item.desc!),
        trailing: Text(
          '\$${item.price.toString()}',
          textScaleFactor: 1.5,
          style: const TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
