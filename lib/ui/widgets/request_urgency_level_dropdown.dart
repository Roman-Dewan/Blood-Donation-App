import 'package:flutter/material.dart';

class RequestUrgencyLevelDropdown extends StatelessWidget{
  final String? value;
  final ValueChanged<String?> onChanged;

  static const List<String> urgencyLevel = [
   "Critical", "Urgent", "Routine"
  ];

  const RequestUrgencyLevelDropdown({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      initialValue: value,
      hint: const Text("Select Urgency"),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),

      items: urgencyLevel
          .map(
            (type) => DropdownMenuItem<String>(value: type, child: Text(type)),
          )
          .toList(),
      onChanged: onChanged,
    );
  }
}
