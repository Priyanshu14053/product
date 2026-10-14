import 'package:flutter/material.dart';
import 'package:mart/widgets/button/primary_Button.dart';
import 'package:mart/widgets/textfield/textfield.dart';

import 'login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();


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

                    const SizedBox(height: 20),

                    Text(
                      'Register Now',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    AppTextfield(
                      label: 'Username',
                      hint: 'Enter your username',
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
                            ),
                        ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                      ),

                    const SizedBox(height: 10),

                    AppTextfield(
                      label: 'Confirm Password',
                      hint: 'Reenter your password',
                      controller: confirmPasswordController,
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
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        if(value != passwordController.text){
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 20),

                    PrimaryButton(
                        label: 'Register',
                        icon: Icons.person,
                        isLoading: isLoading,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Login(),
                            ),
                          );
                          }
                        ),

                    const SizedBox(height: 10,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have account'),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Login(),
                              ),
                            );
                          },
                          child: Text('Login'),
                        ),
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
