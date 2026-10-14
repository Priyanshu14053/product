
import 'package:flutter/foundation.dart';

class CartService extends ChangeNotifier {
  CartService._();

  static final CartService instance = CartService._();

  final List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems =>
      List.unmodifiable(_cartItems);

  void addToCart(Map<String, dynamic> product) {
    final index = _cartItems.indexWhere(
          (item) => item['id'] == product['id'],
    );

    if (index != -1) {
      _cartItems[index]['quantity'] =
          (_cartItems[index]['quantity'] as int) + 1;
    } else {
      _cartItems.add({
        ...product,
        'quantity': 1,
      });
    }

    notifyListeners();
  }

  void removeFromCart(int productId) {
    _cartItems.removeWhere((item) => item['id'] == productId);
    notifyListeners();
  }

  void increaseQuantity(int productId) {
    final index = _cartItems.indexWhere(
          (item) => item['id'] == productId,
    );

    if (index != -1) {
      _cartItems[index]['quantity'] =
          (_cartItems[index]['quantity'] as int) + 1;
      notifyListeners();
    }
  }

  void decreaseQuantity(int productId) {
    final index = _cartItems.indexWhere(
          (item) => item['id'] == productId,
    );

    if (index != -1) {
      final quantity = _cartItems[index]['quantity'] as int;

      if (quantity > 1) {
        _cartItems[index]['quantity'] = quantity - 1;
      } else {
        _cartItems.removeAt(index);
      }

      notifyListeners();
    }
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

}
