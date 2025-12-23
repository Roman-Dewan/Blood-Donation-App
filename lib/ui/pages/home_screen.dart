import 'package:blood_donation/app_color.dart';
import 'package:blood_donation/ui/pages/register_donor.dart';
import 'package:blood_donation/ui/widgets/blood_status_card.dart';
import 'package:blood_donation/ui/widgets/home_screen_activity_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String name = "/home-screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // app bar
        backgroundColor: AppColor.appBarBgColor,
        toolbarHeight: 140,
        title: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Good morning, Roman!",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        "Ready to save a life today?",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.notifications_none, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: FilledButton(
                      onPressed: () {},
                      style: FilledButton.styleFrom(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        backgroundColor: Colors.white24,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.search_rounded),
                          const SizedBox(width: 4),
                          Text("Find Donors"),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: FilledButton(
                      onPressed: () {},
                      style: FilledButton.styleFrom(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        backgroundColor: AppColor.buttonWhiteColor,
                        foregroundColor: AppColor.buttonRedColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.favorite_border_outlined),
                          const SizedBox(width: 4),
                          Text("Request Blood"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Home screen activity card
              Row(
                children: [
                  Expanded(
                    child: HomeScreenActivityCard(
                      count: '12',
                      shortDescription: 'Lives Saved',
                      iconData: Icons.group,
                      color: AppColor.kred,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: HomeScreenActivityCard(
                      count: '45 days ago',
                      shortDescription: 'Lives Donation',
                      iconData: Icons.calendar_today_outlined,
                      color: AppColor.kgreen,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: HomeScreenActivityCard(
                      count: '8 times',
                      shortDescription: 'Dontaions',
                      iconData: Icons.download_done,
                      color: AppColor.kpurple,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Urgent Request Card
              Container(
                height: 300,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColor.kgrey),
                ),
                width: double.maxFinite,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.error_outline,
                              color: AppColor.redIconColor,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "Urgent Requests Nearby",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "View All",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // critical card
                    BloodStatusCard(
                      bloodGroup: '0+',
                      hospitalName: 'City Hospital',
                      distance: '2.3',
                      status: 'Critical',
                      bgColor: AppColor.kred,
                      fgColor: AppColor.kWhite,
                    ),
                    const SizedBox(height: 8),
                    BloodStatusCard(
                      bloodGroup: 'AB+',
                      hospitalName: 'Metro medical',
                      distance: '4.1',
                      status: 'Urgent',
                      bgColor: AppColor.korange,
                      fgColor: AppColor.kred,
                    ),
                    const SizedBox(height: 8),
                    BloodStatusCard(
                      bloodGroup: 'B-',
                      hospitalName: 'Central Clinic',
                      distance: '1.8',
                      status: 'Needed',
                      bgColor: AppColor.kWhite,
                      fgColor: AppColor.kblack,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Become a life saver
              Container(
                width: double.maxFinite,
                height: 200,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 250, 225, 225),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person_add_alt_outlined,
                      color: AppColor.redIconColor,
                      size: 40,
                    ),
                    Text(
                      "Become a life saver",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      "Join our community of heroes and help save lives in your area.",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColor.greyFontColor,
                        fontSize: 11,
                      ),
                    ),
                    const SizedBox(height: 8),
                    FilledButton(
                      style: FilledButton.styleFrom(
                        minimumSize: Size(double.maxFinite, 8),
                        backgroundColor: AppColor.kred,
                      ),
                      onPressed: _onTapRegisterDonor,
                      child: Text("Request as Donor"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
void _onTapRegisterDonor() {
    Navigator.pushNamed(context, RegisterDonor.name);
  }
}

