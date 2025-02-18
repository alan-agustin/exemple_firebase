import 'package:flutter/material.dart';

class Boto extends StatelessWidget {
  final String text;
  final Function() onTap;
  const Boto({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Text(text, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 4),),
        ),
      ),
    );
  }
}