import 'package:flutter/material.dart';
import 'package:mart/data/models/order_data.dart';

import '../../../data/models/cart_data.dart';

class CartTab extends StatefulWidget {
  const CartTab({super.key});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  // Calculate total price
  double get totalPrice {
    double total = 0;

    for (final item in cartItems) {
      final price = double.parse(
        item['price']
            .toString()
            .replaceAll('₹', '')
            .replaceAll(',', ''),
      );

      total += price * item['quantity'];
    }

    return total;
  }

  // Increase quantity
  void increaseQuantity(int index) {
    setState(() {
      cartItems[index]['quantity']++;
    });
  }

  // Decrease quantity
  void decreaseQuantity(int index) {
    setState(() {
      if (cartItems[index]['quantity'] > 1) {
        cartItems[index]['quantity']--;
      }
    });
  }

  // Delete product
  void deleteItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  // Show confirmation dialog
  void showConfirmOrderDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Confirm Order',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Are you sure you want to place this order?',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total Amount',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  Text(
                    '₹${totalPrice.toStringAsFixed(0)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);

                placeOrder();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
              ),
              child: const Text('Confirm Order'),
            ),
          ],
        );
      },
    );
  }

  // Place order
  void placeOrder() {
    final orderTotal = totalPrice;

    // Save the current cart as an order
    createOrder(
      items: cartItems,
      total: orderTotal,
    );

    // Clear cart after saving order
    setState(() {
      cartItems.clear();
    });

    // Show success message
    showOrderSuccessDialog();
  }

  // Order success dialog
  void showOrderSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 70,
              ),

              const SizedBox(height: 16),

              const Text(
                'Order Confirmed!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Your order has been placed successfully.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                    ),
                  ),
                  child: const Text(
                    'Continue Shopping',
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // =========================
          // HEADER
          // =========================
          const Padding(
            padding: EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'My Cart',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // =========================
          // CART ITEMS
          // =========================
          Expanded(
            child: cartItems.isEmpty
                ? const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 70,
                    color: Colors.grey,
                  ),

                  SizedBox(height: 16),

                  Text(
                    'Your cart is empty',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(height: 6),

                  Text(
                    'Add some products to your cart',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
                : ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final product = cartItems[index];

                return Card(
                  margin: const EdgeInsets.only(
                    bottom: 12,
                  ),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(
                      color: Colors.grey.shade200,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        // =========================
                        // PRODUCT IMAGE
                        // =========================
                        Container(
                          width: 80,
                          height: 80,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius:
                            BorderRadius.circular(12),
                          ),
                          child: Image.asset(
                            product['imageUrl'],
                            fit: BoxFit.contain,
                            errorBuilder:
                                (context, error, stackTrace) {
                              return const Icon(
                                Icons
                                    .image_not_supported_outlined,
                                color: Colors.grey,
                              );
                            },
                          ),
                        ),

                        const SizedBox(width: 12),

                        // =========================
                        // PRODUCT DETAILS
                        // =========================
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                product['name'],
                                maxLines: 2,
                                overflow:
                                TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight:
                                  FontWeight.w600,
                                ),
                              ),

                              const SizedBox(height: 6),

                              Text(
                                product['price'],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight:
                                  FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 10),

                              // =========================
                              // QUANTITY
                              // =========================
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors
                                            .grey
                                            .shade300,
                                      ),
                                      borderRadius:
                                      BorderRadius
                                          .circular(8),
                                    ),
                                    child: Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            decreaseQuantity(
                                              index,
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.remove,
                                            size: 18,
                                          ),
                                          constraints:
                                          const BoxConstraints(
                                            minWidth: 35,
                                            minHeight: 35,
                                          ),
                                          padding:
                                          EdgeInsets.zero,
                                        ),

                                        Text(
                                          '${product['quantity']}',
                                          style:
                                          const TextStyle(
                                            fontWeight:
                                            FontWeight
                                                .bold,
                                            fontSize: 15,
                                          ),
                                        ),

                                        IconButton(
                                          onPressed: () {
                                            increaseQuantity(
                                              index,
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.add,
                                            size: 18,
                                          ),
                                          constraints:
                                          const BoxConstraints(
                                            minWidth: 35,
                                            minHeight: 35,
                                          ),
                                          padding:
                                          EdgeInsets.zero,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // =========================
                        // DELETE
                        // =========================
                        IconButton(
                          onPressed: () {
                            deleteItem(index);
                          },
                          icon: const Icon(
                            Icons.delete_outline,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // =========================
          // TOTAL + PLACE ORDER
          // =========================
          if (cartItems.isNotEmpty)
            Container(
              padding: const EdgeInsets.fromLTRB(
                20,
                16,
                20,
                20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(
                      alpha: 0.08,
                    ),
                    blurRadius: 10,
                    offset: const Offset(0, -3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Total
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        '₹${totalPrice.toStringAsFixed(0)}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  // Place order
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: showConfirmOrderDialog,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(14),
                        ),
                      ),
                      child: const Text(
                        'Place Order',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}