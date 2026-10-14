
import 'package:flutter/material.dart';
import 'package:mart/services/cart_service.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final VoidCallback? onTap;
  final VoidCallback? onAddtoCart;

  const ProductCard({
    super.key,
    required this.product,
    this.onTap,
    this.onAddtoCart,
  });

  @override
  Widget build(BuildContext context) {
    final cart = CartService.instance;

    return ListenableBuilder(
      listenable: cart,
      builder: (context, child) {
        final cartItem = cart.cartItems.where(
              (item) => item['id'] == product['id'],
        );

        final quantity = cartItem.isEmpty
            ? 0
            : cartItem.first['quantity'] as int;

        return Card(
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Image.network(
                    product['image'] as String,
                    width: double.infinity,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.image_not_supported,
                        size: 50,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  product['name'].toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '₹${(product['price'] as num).toStringAsFixed(2)}',
                ),
                const SizedBox(height: 8),

                // Add button or quantity controls
                if (quantity == 0)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        cart.addToCart(product);
                        onAddtoCart?.call();
                      },
                      child: const Text('Add to Cart'),
                    ),
                  )
                else
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          cart.decreaseQuantity(product['id'] as int);
                        },
                        icon: const Icon(Icons.remove_circle_outline),
                      ),
                      Text(
                        '$quantity',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          cart.increaseQuantity(product['id'] as int);
                        },
                        icon: const Icon(Icons.add_circle_outline),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
