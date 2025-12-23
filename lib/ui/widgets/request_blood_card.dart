import 'package:flutter/material.dart';

class RequestBloodCard extends StatelessWidget {
  const RequestBloodCard({
    super.key,
    required this.label, required this.child,
  });

  final String label;
  final Widget child;
  

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.bodySmall),
        child
      ],
    );
  }
}
