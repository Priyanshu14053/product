import 'package:flutter/material.dart';

class Homesearchbar extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String> onChanged;
  final VoidCallback? onTap;

  const Homesearchbar({
    super.key,
    this.controller,
    required this.onChanged,
    this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: 'Search for products',
        filled: true,
        fillColor: Colors.grey[100],
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
