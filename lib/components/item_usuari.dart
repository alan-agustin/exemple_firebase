import 'package:flutter/material.dart';

class ItemUsuari extends StatelessWidget {
  final String emailUsuari;
  const ItemUsuari({super.key, required this.emailUsuari});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.only(
        top: 10,
        left: 20,
        right: 20,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(emailUsuari),
      ),
    );
  }
}
