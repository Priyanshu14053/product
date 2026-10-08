import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/products.dart';


class ProductApiService {
  Future<List<Product>> getProducts() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/photos'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      return data
          .map((json) => Product.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}