final List<Map<String, dynamic>> cartItems = [];

void addToCart(Map<String, String> product) {
  final existingIndex = cartItems.indexWhere(
        (item) => item['name'] == product['name'],
  );

  if (existingIndex != -1) {
    cartItems[existingIndex]['quantity']++;
  } else {
    cartItems.add({
      ...product,
      'quantity': 1,
    });
  }
}

void removeFromCart(String productName) {
  cartItems.removeWhere(
        (item) => item['name'] == productName,
  );
}