
import 'package:flutter/foundation.dart';
import 'cart_service.dart';

class OrderService extends ChangeNotifier {
  OrderService._();

  static final OrderService instance = OrderService._();

  final List<Map<String, dynamic>> _orders = [];

  List<Map<String, dynamic>> get orders =>
      List.unmodifiable(_orders);

  void placeOrder(CartService cart) {
    if (cart.cartItems.isEmpty) return;

    final items = cart.cartItems.map((item) {
      return Map<String, dynamic>.from(item);
    }).toList();

    final total = items.fold<double>(
      0,
          (sum, item) =>
      sum +
          (item['price'] as num).toDouble() *
              (item['quantity'] as int),
    );

    final order = {
      'orderId': DateTime.now()
          .millisecondsSinceEpoch
          .toString(),
      'items': items,
      'total': total,
      'status': 'Placed',
      'orderDate': DateTime.now(),
    };

    _orders.insert(0, order);

    // Clear the cart only after saving the order.
    cart.clearCart();

    notifyListeners();
  }
}
