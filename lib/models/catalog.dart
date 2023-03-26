class CatalogModel {
  static final List<Item> product = [
    Item(
      id: 1,
      name: 'iPhone 12 Pro',
      desc: 'Apple iPhone 12th generation',
      price: 999,
      color: '#33505a',
      imgUrl:
          'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-12-pro-blue-hero?wid=940&hei=1112&fmt=png-alpha&qlt=80&.v=1604021661000',
    ),
  ];
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
}
