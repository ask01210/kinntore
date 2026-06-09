import 'package:flutter/material.dart';

class NumberSelector extends StatelessWidget{
  final int value;
  final String label;
  final VoidCallback onPlus;
  final VoidCallback onMinus;

  const NumberSelector({
    super.key,
    required this.value,
    required this.label,
    required this.onPlus,
    required this.onMinus,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onMinus,
           icon: const Icon(Icons.remove),
           ),

           Text(
            '$value $label',
            style: const TextStyle(fontSize: 24),
           ),

           IconButton(
            onPressed: onPlus,
             icon: const Icon(Icons.add),
             ),
      ],
    );
  }
  
}