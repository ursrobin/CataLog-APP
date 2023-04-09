import 'package:r1/models/catalog.dart';

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

  // Add items
  void addItem(Item item) => _itemIds.add(item.id);

  // Remove item
  void removeItem(Item item) => _itemIds.remove(item.id);
}
