import 'package:flutter/material.dart';


import 'package:mart/data/services/product_api_service.dart';

import 'package:mart/presentation/widgets/home%20banner/home_banner.dart';
import 'package:mart/presentation/widgets/homeSearchBar/homeSearchBar.dart';
import 'package:mart/presentation/widgets/product_card/product_card.dart';
import 'package:mart/presentation/widgets/section%20title/section_title.dart';
import '../../../data/models/products.dart';
import '../../widgets/category Item/category_item.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  // API service
  final ProductApiService _apiService = ProductApiService();

  // Store products received from API
  List<Product> products = [];

  // Loading state
  bool isLoading = true;

  // Error message
  String? errorMessage;

  @override
  void initState() {
    super.initState();

    getProducts();
  }

  Future<void> getProducts() async {
    try {
      final result = await _apiService.getProducts();

      setState(() {
        products = result;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // -------------------------
            // Greeting
            // -------------------------

            const Text(
              'Hello Priyanshu',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'What are you looking for today?',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 20),

            // -------------------------
            // Search Bar
            // -------------------------

            Homesearchbar(
              onChanged: (value) {
                debugPrint(value);
              },
            ),

            const SizedBox(height: 24),

            // -------------------------
            // Banner
            // -------------------------

            HomeBanner(
              title: 'Super Sale',
              subtitle: 'Up to 50% off on all products',
              onTap: () {},
            ),

            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('hi'),
                Text('hello'),
              ],
            ),
            const SizedBox(height: 24),

            // -------------------------
            // Categories
            // -------------------------

            SectionTitle(
              title: 'Categories',
              onSeeAll: () {},
            ),

            const SizedBox(height: 12),

            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CategoryItem(
                    icon: Icons.phone_android,
                    title: 'Mobiles',
                    onTap: () {},
                  ),
                  CategoryItem(
                    icon: Icons.laptop,
                    title: 'Laptops',
                    onTap: () {},
                  ),
                  CategoryItem(
                    icon: Icons.headphones,
                    title: 'Audio',
                    onTap: () {},
                  ),
                  CategoryItem(
                    icon: Icons.watch,
                    title: 'Wearables',
                    onTap: () {},
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // -------------------------
            // Popular Products
            // -------------------------

            SectionTitle(
              title: 'Popular Products',
              onSeeAll: () {},
            ),

            const SizedBox(height: 12),

            // -------------------------
            // Product Loading / Error / Data
            // -------------------------

            // if (isLoading)
            //   const Center(
            //     child: Padding(
            //       padding: EdgeInsets.all(30),
            //       child: CircularProgressIndicator(),
            //     ),
            //   )
            // else if (errorMessage != null)
            //   Center(
            //     child: Padding(
            //       padding: const EdgeInsets.all(20),
            //       child: Column(
            //         children: [
            //           const Icon(
            //             Icons.error_outline,
            //             size: 40,
            //             color: Colors.red,
            //           ),
            //
            //           const SizedBox(height: 10),
            //
            //           Text(
            //             errorMessage!,
            //             textAlign: TextAlign.center,
            //           ),
            //
            //           const SizedBox(height: 10),
            //
            //           ElevatedButton(
            //             onPressed: getProducts,
            //             child: const Text('Retry'),
            //           ),
            //         ],
            //       ),
            //     ),
            //   )
            // else
            //   GridView.builder(
            //     shrinkWrap: true,
            //     physics: const NeverScrollableScrollPhysics(),
            //     padding: EdgeInsets.zero,
            //
            //     gridDelegate:
            //     const SliverGridDelegateWithMaxCrossAxisExtent(
            //       maxCrossAxisExtent: 280,
            //       crossAxisSpacing: 10,
            //       mainAxisSpacing: 16,
            //       childAspectRatio: 0.72,
            //     ),
            //
            //     itemCount: products.length,
            //
            //     itemBuilder: (context, index) {
            //       final product = products[index];
            //
            //       return ProductCard(
            //         name: product.name,
            //
            //         // Temporary price because API doesn't provide price
            //         price: '₹999',
            //
            //         imageUrl: product.imageUrl,
            //
            //         onTap: () {
            //           debugPrint(
            //             'Selected: ${product.name}',
            //           );
            //         },
            //
            //         onAddToCart: () {
            //           debugPrint(
            //             'Added: ${product.name}',
            //           );
            //         },
            //       );
            //     },
            //   ),
          ],
        ),
      ),
    );
  }
}