import 'package:flutter/material.dart';

class DateSelector extends StatelessWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateChanged;

  const DateSelector({
    super.key,
    required this.selectedDate,
    required this.onDateChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            onDateChanged(
              selectedDate.subtract(
                const Duration(days: 1),
              ),
            );
          },
        ),

        GestureDetector(
          onTap: () async {
            final picked = await showDatePicker(
              context: context,
              initialDate: selectedDate,
              firstDate: DateTime(2020),
              lastDate: DateTime(2035),
            );

            if (picked != null) {
              onDateChanged(picked);
            }
          },
          child: Text(
            '${selectedDate.year}/${selectedDate.month}/${selectedDate.day}',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        IconButton(
          icon: const Icon(Icons.chevron_right),
          onPressed: () {
            onDateChanged(
              selectedDate.add(
                const Duration(days: 1),
              ),
            );
          },
        ),
      ],
    );
  }
}