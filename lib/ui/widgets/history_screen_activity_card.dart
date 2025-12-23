import 'package:blood_donation/app_color.dart';
import 'package:flutter/material.dart';

class HistoryScreenActivityCard extends StatelessWidget {
  const HistoryScreenActivityCard({
    super.key,
    required this.count,
    required this.shortDescription,
    required this.color,
  });
  final int count;
  final String shortDescription;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: AppColor.kwhite,
        borderRadius: BorderRadius.circular(16),
        border: BoxBorder.all(color: AppColor.statusGreenC),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 8),
          Text(count.toString(), style: Theme.of(context).textTheme.titleLarge?.copyWith(color: color)),
          Text(
            shortDescription,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
