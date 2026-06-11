import 'package:flutter/material.dart';

class WeightInput extends StatelessWidget{
  final TextEditingController controller;

  const WeightInput({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 100,
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: '60'),
          ),
        ),

        const SizedBox(width: 10),

        const Text(
          'kg',
          style: TextStyle(fontSize: 24),
        )

      ],
    );
  }
}