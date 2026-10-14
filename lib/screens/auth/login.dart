import 'package:flutter/material.dart';
import 'package:mart/widgets/button/primary_Button.dart';
import 'package:mart/widgets/button/secondary_button.dart';
import 'package:mart/widgets/textfield/textfield.dart';

import '../../widgets/BottonNavigationbar/bottomNavBar.dart';
import '../home/home.dart';
import 'register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;
  bool obscureText = true;
  String? errorMessage;

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
                      Icon(
                        Icons.shopping_cart,
                        size: 100,
                        color: Colors.blue,
                      ),
                      const SizedBox(height: 15),

                      Text(
                        'Welcome to Mart',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                        const SizedBox(height: 20),

                      AppTextfield(
                        label: 'Username',
                        hint: 'Enter your username',
                        controller: usernameController,
                        obscureText: false,
                        prefixIcon: Icons.person,
                        keyboardType: TextInputType.text,
                        maxLines: 1,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter text';
                          }

                          if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value.trim())) {
                            return 'Only letters are allowed';
                          }

                          return null;
                        },
                        ),

                      const SizedBox(height: 10),

                      AppTextfield(
                        label: 'Password',
                        hint: 'Enter your password',
                        controller: passwordController,
                        obscureText: obscureText,
                        prefixIcon: Icons.lock,
                        keyboardType: TextInputType.text,
                        maxLines: 1,
                        suffixIcon: IconButton(
                            onPressed: (){
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                            icon: Icon(
                              obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ))
                      ),

                      const SizedBox(height: 20),

                      PrimaryButton(
                          label: 'Login',
                          icon: Icons.login,
                          isLoading: isLoading,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Bottomnavbar()
                                ),
                            );
                          }
                      ),

                      const SizedBox(height: 20),

                      TextButton(
                        onPressed: () {

                        }, child: Text('Forgot Password?')
                      ),



                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account ? "),
                          TextButton(
                            onPressed:(){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Register()));
                            },
                            child: Text('Register Now'),
                          )
                        ],
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
