import 'package:flutter/material.dart';
import 'package:mart/presentation/widgets/buttons/primary_button.dart';
import 'package:mart/presentation/widgets/buttons/secondary_button.dart';

import '../../widgets/textfields/textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscuredPassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final email = _emailController.text.trim();
    final password = _passwordController.text;

    debugPrint('Email: $email');
    debugPrint('Password: $password');

    Navigator.pushNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //Logo
                      Icon(
                        Icons.shopping_bag_outlined,
                        size: 70,
                      ),
                      SizedBox(height: 24),

                      //Title
                      Text(
                        'Login For Shopping',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 32),

                      //Email
                      AppTextField(
                        label: 'Email',
                        hintText: 'Enter your email',
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: Icons.email,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your email';
                          }

                          final email = value.trim();

                          final emailRegex = RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                          );

                          if (!emailRegex.hasMatch(email)) {
                            return 'Please enter a valid email';
                          }

                          return null;
                        },
                      ),

                      SizedBox(height: 16),

                      //Password
                      AppTextField(
                        label: 'Password',
                        hintText: 'Enter your password',
                        controller: _passwordController,
                        obscureText: _obscuredPassword,
                        prefixIcon: Icons.lock_outline,
                        suffixIcon: IconButton(
                          onPressed: (){
                            setState(() {
                              _obscuredPassword = !_obscuredPassword;
                            });
                          },
                          icon: Icon(
                            _obscuredPassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined
                          ),
                      ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 24),

                      //login
                      PrimaryButton(
                          text: 'Login',
                          icon: Icons.login,
                          onPressed: _login),

                      SizedBox(height: 16),
                      //Register
                      SecondaryButton(
                          text: 'Register',
                          icon: Icons.person_add,
                          onPressed: (){
                            Navigator.pushNamed(context, '/register');
                            debugPrint('Create account');
                          }),

                    ],
                  )
              ),
            ),
          ),
      ),
    );
  }
}
