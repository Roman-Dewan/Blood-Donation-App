import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Add this to your pubspec.yaml for easy formatting

class CustomDatePicker extends StatelessWidget {
  final TextEditingController controller;
  final DateTime? firstDate;
  final DateTime? lastDate;

  const CustomDatePicker({
    super.key,
    required this.controller,
    this.firstDate,
    this.lastDate,
  });

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),

      firstDate: firstDate ?? DateTime(1900),

      lastDate: lastDate ?? DateTime(2100),
    );
    if (picked != null) {
      controller.text = DateFormat('dd/MM/yyyy').format(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: true, // Key: prevents keyboard
      onTap: () => _selectDate(context),
      decoration: InputDecoration(
        hintText: "dd / mm / yyyy",

        suffixIcon: const Icon(Icons.calendar_today_outlined, size: 20),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a date';
        }
        return null;
      },
    );
  }
}
