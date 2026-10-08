import 'package:flutter/material.dart';
import 'package:mart/presentation/auth/screens/login_screen.dart';
import 'package:mart/presentation/auth/screens/register_screen.dart';
import 'package:mart/presentation/cart/screens/cart_tab.dart';
import 'package:mart/presentation/order/screens/order_tab.dart';
import 'package:mart/presentation/profile/screens/profile_tab.dart';

import 'presentation/home/screens/home_sceen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const EmartApp());
}

class EmartApp extends StatelessWidget {
  const EmartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-mart',
      debugShowCheckedModeBanner: false,

      initialRoute: '/',

      routes: {
        '/': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeSceen(),
        '/cart': (context) => const CartTab(),
        '/order': (context) => const OrderTab(),
        '/profile': (context) => const ProfileTab(),

      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white
      ),
    );
  }
}
