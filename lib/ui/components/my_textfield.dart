import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide:
                BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide:
                BorderSide(color: Color.fromARGB(255, 59, 88, 161), width: 1),
          ),
          labelText: hintText,
          hintStyle:
              const TextStyle(color: Color.fromARGB(255, 111, 108, 136))),
    );
  }
}
