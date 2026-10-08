final List<Map<String, dynamic>> orders = [];

  void createOrder({
    required List<Map<String, dynamic>> items,
    required double total,
  }) {
    final order = {
      'orderId': '#ORD${1000 + orders.length + 1}',
      'date': DateTime.now(),
      'status': 'Confirmed',
      'total': total,
      'items': List<Map<String, dynamic>>.from(
        items.map((item) => Map<String, dynamic>.from(item)),
      ),
    };

    orders.add(order);
  }