import 'package:blood_donation/app_color.dart';
import 'package:flutter/material.dart';

class HistoryRequestCard extends StatelessWidget {
  const HistoryRequestCard({
    super.key,
    required this.date,
    required this.hospitalName,
    required this.patientName,
    required this.unitRequest,
    required this.donorsResponse,
  });
  final String date;
  final String hospitalName;
  final String patientName;
  final int unitRequest;
  final int donorsResponse;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.kWhite,
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
                backgroundColor: AppColor.blueFontColor,
                radius: 25,
                child: Text("AB+", style: TextStyle(color: AppColor.kWhite)),
              ),

              const SizedBox(width: 12),
              // name, rating, destinations
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Blood Request",
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium?.copyWith(color: AppColor.kblack),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 20,
                          color: AppColor.kgrey,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          date,
                          style: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(color: Colors.black45),
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
                          hospitalName,
                          style: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(color: Colors.black45),
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
                color: Colors.greenAccent,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: Text(
                    "Fulfiled",
                    style: TextStyle(color: AppColor.kblack, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          Container(
            width: double.maxFinite,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(16),
              border: BoxBorder.all(style: BorderStyle.none),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Units requested:",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Spacer(),
                    Text(
                      unitRequest.toString(),
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Donors responded:",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Spacer(),
                    Text(
                      donorsResponse.toString(),
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Patient:",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Spacer(),
                    Text(
                      patientName,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
