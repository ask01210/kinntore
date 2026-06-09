import 'package:flutter/material.dart';

class Password extends StatelessWidget {
  final TextEditingController controller;


  const Password({
    super.key,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: TextField(
        controller: controller,
        obscureText: true,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Password',
        ),
      ),
    );
  }
}
