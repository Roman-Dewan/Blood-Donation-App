import 'package:flutter/material.dart';

class GenderDropdownCard extends StatelessWidget{
  final String? value;
  final ValueChanged<String?> onChanged;

  static const List<String> gender = [
   "Male", "Female", "Custom"
  ];

  const GenderDropdownCard({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      initialValue: value,
      hint: const Text("Select gender"),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),

      items: gender
          .map(
            (type) => DropdownMenuItem<String>(value: type, child: Text(type)),
          )
          .toList(),
      onChanged: onChanged,
    );
  }
}
