import 'package:blood_donation/app_color.dart';
import 'package:flutter/material.dart';

class DonorCard extends StatelessWidget {
  const DonorCard({
    super.key,
    required this.bloodGroup,
    required this.name,
    required this.rating,
    required this.hospitalName,
    required this.distance,
    required this.status,
    required this.statusColor,
    required this.noOfDontation,
  });
  final String bloodGroup;
  final String name;
  final String rating;
  final String hospitalName;
  final String distance;
  final String status;
  final Color statusColor;
  final int noOfDontation;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: double.maxFinite,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(width: 1, color: AppColor.kgrey),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                backgroundColor: AppColor.kred,
                radius: 25,
                child: Text(bloodGroup, style: TextStyle(color: AppColor.kWhite)),
              ),

              const SizedBox(width: 12),
              // name, rating, destinations
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: Theme.of(context).textTheme.titleMedium),
                    Row(
                      children: [
                        Icon(Icons.star_border_rounded, color: AppColor.kamber),
                        const SizedBox(width: 4),
                        Text(
                          "$rating - $noOfDontation donations",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.grey.shade600,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "$hospitalName - $distance km",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // status
              Card(
                elevation: 0,
                margin: EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                color: statusColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: Text(
                    status,
                    style: TextStyle(color: AppColor.kblack, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),
          // button
          Row(
            children: [
              Expanded(
                child: FilledButton.icon(
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColor.kred,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {},
                  label: Text("Contact"),
                  icon: Icon(Icons.call),
                ),
              ),

              const SizedBox(width: 8),

              Expanded(
                child: FilledButton.icon(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColor.kWhite,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(color: Colors.grey.shade400),
                    ),
                  ),
                  label: Text(
                    "View Profile",
                    style: TextStyle(color: AppColor.kblack),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
