class Item {
  final double offerPrice;
  final String image;
  int qty;
  final String name;
  final String desc;
  final double rate;
  final double price;
  final int kcal;
  final String protiens;
  final String carbo;
  final String fiber;

  Item(
      {required this.offerPrice,
      required this.desc,
      required this.rate,
      required this.kcal,
      required this.protiens,
      required this.carbo,
      required this.fiber,
      required this.image,
      required this.name,
      required this.price,
      this.qty = 0});
}
