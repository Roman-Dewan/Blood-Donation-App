import 'package:blood_donation/app_color.dart';
import 'package:flutter/material.dart';

class AchievementCard extends StatelessWidget {
  const AchievementCard({
    super.key,
    this.bgColor,
    required this.data,
    this.icon,
  });

  final Color? bgColor;
  final String data;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth( 
      child: Card(
        color: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,     
            children: [
              Icon(icon, size: 20, color: AppColor.kgrey),
              const SizedBox(width: 8),
              Text(
                data,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

