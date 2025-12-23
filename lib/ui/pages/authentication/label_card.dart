import 'package:flutter/material.dart';


class LabelCard extends StatelessWidget {
  const LabelCard({
    super.key,
    required this.label,
    required this.child,
    required this.icon,
  });

  final String label;
  final Widget child;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 20, color: Colors.grey.shade800),
            const SizedBox(width: 8),
            Text(label, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
        const SizedBox(height: 4),
        child,
      ],
    );
  }
}
