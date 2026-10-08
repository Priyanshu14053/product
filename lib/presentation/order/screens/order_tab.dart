import 'package:flutter/material.dart';

import '../../../data/models/order_data.dart';

class OrderTab extends StatelessWidget {
  const OrderTab({super.key});

  String formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'My Orders',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Orders
          Expanded(
            child: orders.isEmpty
                ? const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.receipt_long_outlined,
                    size: 70,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'No orders yet',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Your confirmed orders will appear here',
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
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];

                final List items = order['items'];

                return Card(
                  margin: const EdgeInsets.only(
                    bottom: 14,
                  ),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(
                      color: Colors.grey.shade200,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        // Order ID + Status
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                order['orderId'],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green.shade50,
                                borderRadius:
                                BorderRadius.circular(20),
                              ),
                              child: Text(
                                order['status'],
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 6),

                        Text(
                          formatDate(order['date']),
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 13,
                          ),
                        ),

                        const SizedBox(height: 16),

                        const Divider(),

                        const SizedBox(height: 10),

                        // Products
                        ...items.map(
                              (item) {
                            return Padding(
                              padding:
                              const EdgeInsets.only(bottom: 12),
                              child: Row(
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    padding:
                                    const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color:
                                      Colors.grey.shade100,
                                      borderRadius:
                                      BorderRadius.circular(10),
                                    ),
                                    child: Image.asset(
                                      item['imageUrl'],
                                      fit: BoxFit.contain,
                                    ),
                                  ),

                                  const SizedBox(width: 12),

                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item['name'],
                                          maxLines: 2,
                                          overflow:
                                          TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontWeight:
                                            FontWeight.w600,
                                          ),
                                        ),

                                        const SizedBox(height: 4),

                                        Text(
                                          'Qty: ${item['quantity']}',
                                          style: TextStyle(
                                            color: Colors
                                                .grey.shade600,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Text(
                                    item['price'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),

                        const Divider(),

                        const SizedBox(height: 10),

                        // Total
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '₹${order['total'].toStringAsFixed(0)}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}