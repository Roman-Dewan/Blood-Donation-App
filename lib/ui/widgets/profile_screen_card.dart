import 'package:flutter/material.dart';

class ProfileScreenCard extends StatelessWidget {
  const ProfileScreenCard({
    super.key, required this.data, required this.value, required this.icon, required this.bgColor
  });
  final String value;
  final String data;
  final IconData icon;
  final Color bgColor;
  

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade500),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Column(
          children: [
            Icon(icon, color: bgColor),
            const SizedBox(height: 8),
            Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color:bgColor)),
            Text(
              data,
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}