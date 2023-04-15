import 'package:r1/core/store.dart';
import 'package:r1/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  late CatalogModel _catalog;

  // Store ids of each item added to cart
  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newcatalog) {
    _catalog = newcatalog;
  }

  // Get items in the cart
  List<Item> get items =>
      _itemIds.map((id) => CatalogModel.getById(id)).toList();

  // Get total price

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);

  @override
  perform() {
    store!.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);

  @override
  perform() {
    store!.cart._itemIds.remove(item.id);
  }
}
