class CatalogModel {
  static final catalogModel = CatalogModel._internal();
  CatalogModel._internal();
  factory CatalogModel() => catalogModel;

  static List<Item>? product;

  // Get by Id
  static Item getById(int id) =>
      product!.firstWhere((element) => element.id == id);

  static Item getByPosition(int pos) => product![pos];
}

class Item {
  final int id;
  final String name;
  final String? desc;
  final num price;
  final String? color;
  final String imgUrl;

  Item(
      {required this.id,
      required this.name,
      this.desc,
      required this.price,
      this.color,
      required this.imgUrl});
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      imgUrl: map["image"],
    );
  }
}
