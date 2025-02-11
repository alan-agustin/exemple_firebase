import 'package:flutter/material.dart';

class Textofiel extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String hint;
  const Textofiel({
    super.key,
    required this.controller,
    required this.hint,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25),
      child: TextField(
        cursorColor: Colors.blue,
        style: TextStyle(
          color: Colors.blue,
        ),
        controller: controller,
        obscureText: obscureText,
        decoration:  InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.blue,
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 21, 109, 182))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 21, 109, 182))),
          fillColor: Color.fromARGB(255, 14, 44, 70),
          filled: true,
        ),
      ),
    );
  }
}
