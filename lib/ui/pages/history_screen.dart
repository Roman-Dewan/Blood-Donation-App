import 'package:blood_donation/app_color.dart';
import 'package:blood_donation/ui/widgets/history_badge_card.dart';
import 'package:blood_donation/ui/widgets/history_donation_card.dart';
import 'package:blood_donation/ui/widgets/history_request_card.dart';
import 'package:blood_donation/ui/widgets/history_screen_activity_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});
  static String name = "/history-screen";

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

enum History { donatations, requests, badges }

class _HistoryScreenState extends State<HistoryScreen> {
  History historyView = History.donatations;
  int? _sliding = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actionsPadding: EdgeInsets.all(8),
          elevation: 0,
          backgroundColor: AppColor.backgroundColor,
          title: Text("Your Impact"),
          actions: [
            FilledButton.icon(
              onPressed: () {},
              style: FilledButton.styleFrom(
                backgroundColor: AppColor.backgroundColor,
                foregroundColor: AppColor.kblack,
                textStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              label: Center(child: Text("Export")),
              icon: Icon(Icons.file_download_outlined, size: 20),
            ),
          ],
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              Divider(color: AppColor.kgrey),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // History Screen Activity Card
                    Row(
                      children: [
                        Expanded(
                          child: HistoryScreenActivityCard(
                            count: 8,
                            shortDescription: "Total Donations",
                            color: AppColor.kred,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: HistoryScreenActivityCard(
                            count: 12,
                            shortDescription: "Lives Saved",
                            color: AppColor.kgreen,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: HistoryScreenActivityCard(
                            count: 2,
                            shortDescription: "Requests Made",
                            color: AppColor.kblue,
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),

                    // Card complete

                    // Segmented Button start
                    const SizedBox(height: 16),

                    Container(
                      color: Colors.grey.shade100,
                      width: double.maxFinite,
                      child: CupertinoSlidingSegmentedControl(
                        children: {
                          0: Text(
                            "Donations",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          1: Text(
                            "Requests",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          2: Text(
                            "Badges",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        },
                        groupValue: _sliding,
                        padding: EdgeInsets.all(4),
                        thumbColor: Colors.white,
                        onValueChanged: (int? newValue) {
                          setState(() {
                            _sliding = newValue;
                            debugPrint("The index value is $_sliding");
                          });
                        },
                      ),
                    ),

                    //  _sliding == 0
                    const SizedBox(height: 16),

                    getSelectedView()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getSelectedView() {
    switch (_sliding) {
      case 0:
        return const BuildDonationList();
      case 1:
        return const BuildRequestList();
      case 2:
        return const BuildBadgeList();
      default:
        return const BuildDonationList();
    }
  }
}

class BuildBadgeList extends StatelessWidget {
  const BuildBadgeList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: 4,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return HistoryBadgeCard();
      },
    );
  }
}


class BuildRequestList extends StatelessWidget {
  const BuildRequestList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return HistoryRequestCard(
          date: "12/07/25",
          hospitalName: "ABC Hospital",
          patientName: "Annoynomus",
          unitRequest: 2,
          donorsResponse: 3,
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 8);
      },
      itemCount: 3,
    );
  }
}

class BuildDonationList extends StatelessWidget {
  const BuildDonationList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Next Donation Elibible: September 15, 2025",
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(height: 8),
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return HistoryDonationCard(
              title: "Whole Blood donation",
              date: "12/12/2025",
              hospitalName: "City General Hospital",
              unitDonated: 2,
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 8);
          },
        ),
      ],
    );
  }
}
