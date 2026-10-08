import 'package:flutter/material.dart';
import 'package:mart/presentation/cart/screens/cart_tab.dart';
import 'package:mart/presentation/home/screens/home_tab.dart';
import 'package:mart/presentation/order/screens/order_tab.dart';
import 'package:mart/presentation/profile/screens/profile_tab.dart';
import 'package:mart/presentation/widgets/bottomNavbar/bottomNavbar.dart';

class HomeSceen extends StatefulWidget {
  const HomeSceen({super.key});

  @override
  State<HomeSceen> createState() => _HomeSceenState();
}

class _HomeSceenState extends State<HomeSceen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeTab(),
    const CartTab(),
    const OrderTab(),
    const ProfileTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('E-mart'),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed:(){
                //Notification
              },
              icon: const Icon(Icons.notifications)),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          }),
    );
  }
}
