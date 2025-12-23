import 'package:blood_donation/app_color.dart';
import 'package:flutter/material.dart';

class HomeScreenActivityCard extends StatelessWidget {
  const HomeScreenActivityCard({
    super.key,
    required this.count,
    required this.shortDescription,
    required this.iconData,
    required this.color,
  });
  final String count;
  final String shortDescription;
  final IconData iconData;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: AppColor.kwhite,
        borderRadius: BorderRadius.circular(8),
        border: BoxBorder.all(color: AppColor.kgrey),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconData, color: color, size: 20),
          const SizedBox(height: 8),
          Text(count, style: Theme.of(context).textTheme.titleSmall),
          Text(
            shortDescription,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}
