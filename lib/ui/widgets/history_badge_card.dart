import 'package:blood_donation/app_color.dart';
import 'package:flutter/material.dart';

class HistoryBadgeCard extends StatelessWidget {
  const HistoryBadgeCard({
    super.key,
  });
  // final IconData icon;
  // final String title;
  // final String subtitle;
  

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber[50],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(width: 1, color: Colors.amber),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.badge_sharp, color: Colors.amber),
          const SizedBox(height: 8),
          Text(
            "Life Saver",
            style: Theme.of(context).textTheme.bodyMedium
                ?.copyWith(color: AppColor.kblack),
          ),
          Text(
            "Saved 12 lives",
            style: Theme.of(context).textTheme.bodyMedium
                ?.copyWith(color: AppColor.kblack),
          ),
          Chip(
            label: Text("Earned"),
            backgroundColor: Colors.amber.shade200,
          ),
        ],
      ),
    );
  }
}
