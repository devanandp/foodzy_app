///Model for items in the cart

class CartModel {
  final String? title;
  final String? price;
  final String productId;
  final int? quantity;

  CartModel({
    required this.title,
    required this.price,
    required this.productId,
    required this.quantity,
  });
}
