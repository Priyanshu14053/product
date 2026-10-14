import 'package:flutter/material.dart';
import 'package:mart/screens/auth/login.dart';

void main(){
  return runApp(Mart());
}

class Mart extends StatelessWidget {
  const Mart({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mart',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white
      ),
      home: Login(),
    );
  }
}
