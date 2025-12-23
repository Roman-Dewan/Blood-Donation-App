import 'package:flutter/material.dart';

class BloodTypeDropdown extends StatelessWidget {
  const BloodTypeDropdown({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final String? value;
  final ValueChanged<String?> onChanged;

  static const List<String> bloodTypes = [
    "A+",
    "A-",
    "B+",
    "B-",
    "AB+",
    "AB-",
    "O+",
    "O-",
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      initialValue: value,
      hint: const Text("Blood type"),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      items: bloodTypes
          .map(
            (type) => DropdownMenuItem<String>(
              value: type,
              child: Text(type),
            ),
          )
          .toList(),
      onChanged: onChanged,
    );
  }
}
