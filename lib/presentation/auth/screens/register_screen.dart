import 'package:flutter/material.dart';
import 'package:mart/presentation/widgets/textfields/textfield.dart';

import '../../widgets/buttons/primary_button.dart';
import '../../widgets/buttons/secondary_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscuredPassword = true;
  bool _obscuredConfirmPassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void register() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    debugPrint('Name: $name');
    debugPrint('Email: $email');
    debugPrint('Password: $password');
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
                  SizedBox(height: 20),
                  //Title
                  Text(
                    'Register For Shopping',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30),
                  //fields
                  AppTextField(
                      label: 'Name',
                      hintText: 'Enter your name',
                      controller: _nameController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Name is required';
                      }

                      final name = value.trim();

                      if (name.length < 2) {
                        return 'Name must be at least 2 characters';
                      }

                      if (name.length > 50) {
                        return 'Name must not exceed 50 characters';
                      }

                      if (!RegExp(r"^[a-zA-Z ]+$").hasMatch(name)) {
                        return 'Name can contain only letters and spaces';
                      }

                      return null;
                    },
                  ),

                  SizedBox(height: 16),

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

                  // Password
                  AppTextField(
                    label: 'Password',
                    hintText: 'Enter your password',
                    controller: _passwordController,
                    obscureText: _obscuredPassword,
                    prefixIcon: Icons.lock_outline,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscuredPassword = !_obscuredPassword;
                        });
                      },
                      icon: Icon(
                        _obscuredPassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
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

                  const SizedBox(height: 16),

                  // Confirm Password
                  AppTextField(
                    label: 'Confirm Password',
                    hintText: 'Re-enter your password',
                    controller: _confirmPasswordController,
                    obscureText: _obscuredConfirmPassword,
                    prefixIcon: Icons.lock_outline,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscuredConfirmPassword =
                          !_obscuredConfirmPassword;
                        });
                      },
                      icon: Icon(
                        _obscuredConfirmPassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please re-enter your password';
                      }

                      if (value != _passwordController.text) {
                        return 'Password does not match';
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: 16),

                  //Register
                  PrimaryButton(
                      text: 'Register',
                      icon: Icons.person_add,
                      onPressed: register),
                  SizedBox(height: 16),
                  //Login
                  SecondaryButton(
                    text: 'Already have an account? Login',
                    onPressed: () {

                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
        ),
      ),
      ),
    );
  }
}
