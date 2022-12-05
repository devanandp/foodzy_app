///Provider class for Cart related actions

import 'package:foodzy/foodzy_app.dart';

class CartViewModel extends ChangeNotifier {
  ///Getter for Cart quantity
  int get cartQuantity {
    int cartQuantity = 0;
    _items.forEach((key, value) {
      cartQuantity += value.quantity!;
    });
    return cartQuantity;
  }

  ///Storage map for cart Items
  Map<String, CartModel> _items = {};

  ///Getter for Cart items Map
  Map<String, CartModel> get items {
    return {..._items};
  }

  ///Method to add Items to Cart
  void addItem({required String productId, price, title}) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (value) => CartModel(
              title: value.title,
              price: value.price,
              productId: productId,
              quantity: value.quantity! + 1));

      notifyListeners();
    } else {
      _items.putIfAbsent(
          productId,
          () => CartModel(
                title: title.toString(),
                price: price.toString(),
                productId: productId,
                quantity: 1,
              ));
      notifyListeners();
    }
  }

  ///Method to remove quantity from already added product in Cart
  void removeQuantity({required String productId, price, title}) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (value) => CartModel(
              title: value.title,
              price: value.price,
              productId: value.productId,
              quantity: value.quantity! - 1));

      notifyListeners();
    }
  }

  ///Getter for Total Items Cost Price
  double get totalToPay {
    double total = 0.0;
    _items.forEach((key, value) {
      total += double.parse(
          (double.parse(value.price!) * value.quantity!).toStringAsFixed(2));
    });
    return total / 100;
  }

  ///Getter for Delivery fee. Includes 5% of Total Cost Price calculation
  double get deliveryFee =>
      double.parse(((totalToPay * 5) / 100).toStringAsFixed(2));

  ///Getter for total Order fee
  double get orderFee =>
      double.parse((totalToPay + deliveryFee).toStringAsFixed(2));

  ///Method to remove the entire item from the Cart
  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  ///Method to clear the entire cart
  void clearCart() {
    _items = {};
    notifyListeners();
  }
}
