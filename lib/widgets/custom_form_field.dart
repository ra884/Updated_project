import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
  final String hint;
  final IconData icon;
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  CustomFormField({
    super.key,
    required this.hint,
    required this.icon,
    this.isPassword = false,
    this.validator,
    this.controller,
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool isObsecure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.isPassword && isObsecure,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 150, 76, 220),
            width: 5,
          ),
        ),
        iconColor: const Color.fromARGB(255, 150, 76, 220),
        hintText: widget.hint,
        prefixIcon: Icon(widget.icon),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isObsecure = !isObsecure;
                  });
                },
                icon: isObsecure
                    ? Icon(Icons.visibility)
                    : Icon(Icons.visibility_off),
              )
            : null,
      ),
    );
  }
}
