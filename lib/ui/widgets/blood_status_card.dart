import 'package:blood_donation/app_color.dart';
import 'package:flutter/material.dart';

class BloodStatusCard extends StatelessWidget {
  final String bloodGroup, hospitalName, distance, status;
  // final String hospitalName;
  // final String distance;
  // final String status;
  final Color bgColor, fgColor;

  const BloodStatusCard({
    super.key,
    required this.bloodGroup,
    required this.hospitalName,
    required this.distance,
    required this.status,
    required this.bgColor,
    required this.fgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: 60,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 250, 225, 225),
        borderRadius: BorderRadius.circular(16),
        border: BoxBorder.all(style: BorderStyle.none),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColor.kred,
                child: Text(
                  bloodGroup,
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(color: AppColor.kwhite),
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hospitalName,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined, size: 15),
                      const SizedBox(width: 4),
                      Text(
                        "$distance km",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Chip(
            label: Text(status),
            backgroundColor: bgColor,
            elevation: 0,
            labelStyle: TextStyle(color: fgColor),
            side: BorderSide.none,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(16),
            ),
          ),
          // Chip(child: Text("Critical")),
        ],
      ),
    );
  }
}
