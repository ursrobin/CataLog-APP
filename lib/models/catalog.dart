class CatalogModel {
  static List<Item>? product;
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
