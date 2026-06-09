import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final VoidCallback onPressed;

  const Button({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: ElevatedButton(
        onPressed: onPressed,
        child: const Text('ログイン'),
      ),
    );
  }
}
