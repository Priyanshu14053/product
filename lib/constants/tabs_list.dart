import 'package:flutter/material.dart';

class TabsList {
  TabsList._();

  static const List<Map<String, dynamic>> tab = [
    {
      'title': 'Home',
      'icon': Icons.home_outlined,
    },
    {
      'title': 'Cart',
      'icon': Icons.shopping_basket_outlined,
    },
    {
      'title': 'Orders',
      'icon': Icons.shopping_bag_outlined,
    },
    {
      'title': 'Profile',
      'icon': Icons.person_outline,
    },
  ];
}