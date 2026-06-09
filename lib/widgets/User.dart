import 'package:flutter/material.dart';


class User extends StatelessWidget {
  final TextEditingController controller;

  const User({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'ユーザー名',
        ),
      ),
    );
  }
}
