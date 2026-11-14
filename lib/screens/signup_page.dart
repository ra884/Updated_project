import 'package:flutter/material.dart';
import 'package:flutter_full_application/screens/login_page.dart';
import 'package:flutter_full_application/widgets/custom_form_field.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              children: [
                Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 40, fontWeight: .bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Text(
                    "Create your account",
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
                        hint: "Email",
                        icon: Icons.email,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Required";
                          }
                          if (!value.contains("@")) {
                            return "Incorrect format";
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
                        controller: passwordController,
                      ),
                      CustomFormField(
                        hint: "Confirm Password",
                        icon: Icons.lock,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Required";
                          }
                          if (value != passwordController) {
                            return "Passwords do not match";
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
                        "Sign Up",
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
                Row(
                  spacing: 10,
                  children: [
                    Expanded(child: Divider(thickness: 1)),
                    Text("Or"),
                    Expanded(child: Divider(thickness: 1)),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Sign In With Google",
                      style: TextStyle(
                        fontSize: 15,
                        color: const Color.fromARGB(255, 123, 80, 131),
                        fontWeight: .bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(30),
                      ),
                      side: BorderSide(
                        color: const Color.fromARGB(255, 123, 80, 131),
                        width: 2,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: .center,
                    spacing: 10,
                    children: [
                      Text("Already have an account?"),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },

                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 123, 80, 131),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
