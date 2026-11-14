import 'package:flutter/material.dart';
import 'package:flutter_full_application/screens/products_page.dart';
import 'package:flutter_full_application/screens/signup_page.dart';
import 'package:flutter_full_application/widgets/custom_form_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductsPage()),
            );
          },
          icon: Icon(Icons.home),
        ),
        title: Text("Welcome!"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 150, 76, 220),
      ),
      body: Center(
        child: Container(
          width: 600,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              spacing: 10,
              crossAxisAlignment: .center,
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage(
                    "assets/images/7891-Shopping-guide-2022-1.webp",
                  ),
                ),
                Text(
                  "Welcome Back",
                  style: TextStyle(fontSize: 40, fontWeight: .bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Text(
                    "Enter your credential to login",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Form(
                  key: formKey,
                  child: Column(
                    spacing: 10,
                    children: [
                      CustomFormField(
                        hint: "Username",
                        icon: Icons.person,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Required";
                          }
                        },
                      ),

                      CustomFormField(
                        hint: "Password",
                        icon: Icons.lock,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Required";
                          }
                          if (value.length <= 8) {
                            return "Password must be greater than 8 characters";
                          }
                        },
                        isPassword: true,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (!formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Invalid data"),
                              backgroundColor: Colors.redAccent,
                            ),
                          );
                        }
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: .bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                          255,
                          150,
                          76,
                          220,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(30),
                        ),
                      ),
                    ),
                  ),
                ),
                Text("Forgot password?"),
                Row(
                  mainAxisAlignment: .center,
                  spacing: 10,
                  children: [
                    Text("don't have an account?"),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                        );
                      },

                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 123, 80, 131),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
