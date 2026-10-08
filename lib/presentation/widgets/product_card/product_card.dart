import 'package:flutter/material.dart';

import '../../../data/models/cart_data.dart';

class ProductCard extends StatefulWidget {
  final String name;
  final String price;
  final String imageUrl;
  final VoidCallback? onTap;
  final VoidCallback? onAddToCart;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.imageUrl,
    this.onTap,
    this.onAddToCart,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {

  bool get isAdded {
    return cartItems.any(
          (item) => item['name'] == widget.name,
    );
  }

  void handleAddToCart() {
    addToCart({
      'name': widget.name,
      'price': widget.price,
      'imageUrl': widget.imageUrl,
    });

    setState(() {});

    widget.onAddToCart?.call();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = constraints.maxWidth;

        // Responsive image height
        final imageHeight = cardWidth * 0.65;

        return Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: widget.onTap,
            child: Padding(
              padding: EdgeInsets.all(cardWidth * 0.04),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Image
                  SizedBox(
                    width: double.infinity,
                    height: imageHeight.clamp(120.0, 220.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        widget.imageUrl,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Icon(
                              Icons.image_not_supported_outlined,
                              size: 40,
                              color: Colors.grey,
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  SizedBox(height: cardWidth * 0.04),

                  // Product Name
                  Text(
                    widget.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: (cardWidth * 0.055).clamp(14.0, 18.0),
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(height: cardWidth * 0.02),

                  // Price + Add Button
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          widget.price,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: (cardWidth * 0.05).clamp(14.0, 17.0),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(width: 8),

                      SizedBox(
                        width: (cardWidth * 0.25).clamp(38.0, 52.0),
                        height: (cardWidth * 0.25).clamp(38.0, 52.0),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: handleAddToCart,

                          // Change icon after adding
                          icon: Icon(
                            isAdded
                                ? Icons.check
                                : Icons.add_shopping_cart,
                          ),

                          style: IconButton.styleFrom(
                            backgroundColor:
                            isAdded ? Colors.green : Colors.black,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}