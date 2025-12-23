import 'package:blood_donation/app_color.dart';
import 'package:blood_donation/ui/widgets/achievement_card.dart';
import 'package:blood_donation/ui/widgets/profile_screen_card.dart';
import 'package:blood_donation/ui/widgets/profile_setting_card.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static String name = "/profile-screen";

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool light = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // top part- app bar
            Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: AppColor.kred,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  SafeArea(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: AppColor.kWhite,
                          child: Icon(Icons.person),
                        ),
                        Positioned(
                          left: 48,
                          top: 48,
                          child: Card(
                            elevation: 0,
                            color: AppColor.kWhite,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.camera_alt_outlined),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // personal details.
                  Text(
                    "Roman Dewan",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        elevation: 0,
                        color: Colors.white24,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white60),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("O+"),
                        ),
                      ),

                      Card(
                        elevation: 0,
                        color: Colors.white24,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white60),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.shield_rounded,
                                color: Colors.white54,
                                size: 18,
                              ),
                              const SizedBox(width: 4),
                              Text("Verified"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Member Since January 2023",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),

            // Available for donataion.
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: Colors.grey.shade300),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Available for Donation",
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColor.kblack,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Let others know you're available to help",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColor.kblack,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Switch(
                        value: light,
                        activeThumbColor: AppColor.kred,
                        onChanged: (bool value) {
                          setState(() {
                            light = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // profile screen card
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              child: Row(
                children: [
                  Expanded(
                    child: ProfileScreenCard(
                      data: "Total Donatations",
                      value: "8",
                      icon: Icons.favorite_border,
                      bgColor: AppColor.kred,
                    ),
                  ),
                  Expanded(
                    child: ProfileScreenCard(
                      data: "Lives Impacted",
                      value: "12",
                      icon: Icons.verified_outlined,
                      bgColor: AppColor.kgreen,
                    ),
                  ),
                  Expanded(
                    child: ProfileScreenCard(
                      data: "Donor Rating",
                      value: "4.9",
                      icon: Icons.person_2_outlined,
                      bgColor: AppColor.kblue,
                    ),
                  ),
                ],
              ),
            ),

            // Contact information
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: Colors.grey.shade500),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Contact Information",
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColor.kblack,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Icon(Icons.email_outlined),
                          const SizedBox(width: 8),
                          Text(
                            "roman.dewan18@gmail.com",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.call),
                          const SizedBox(width: 8),
                          Text(
                            "+880 1521738765",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined),
                          const SizedBox(width: 8),
                          Text(
                            "Gazipur, Dhaka, Bangladesh",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Achievement card
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                color: AppColor.kWhite,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: Colors.grey.shade300),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Achievements",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColor.kblack,
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Horizontal Scrolling Area
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            AchievementCard(
                              data: "Life Saver",
                              bgColor: Colors.amber.shade100,

                              icon: Icons.favorite,
                            ),
                            const SizedBox(width: 8),
                            AchievementCard(
                              data: "Regular Donor",
                              bgColor: Colors.blue.shade100,

                              icon: Icons.bloodtype,
                            ),
                            const SizedBox(width: 8),
                            AchievementCard(
                              data: "Community Hero",
                              bgColor: Colors.purple.shade100,

                              icon: Icons.groups,
                            ),
                            const SizedBox(width: 8),
                            AchievementCard(
                              data: "Speedy Response",
                              bgColor: Colors.green.shade100,

                              icon: Icons.bolt,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Next Donation eligible
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  // ignore: deprecated_member_use
                  color: Colors.blue.shade100.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.blue.shade300, width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Next Donation Eligible",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "September 15, 2024",
                      style: TextStyle(color: Colors.blue, fontSize: 22),
                    ),
                    Text(
                      "Mark your calenders",
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // profile setting
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              child: Container(
                width: double.maxFinite,

                padding: EdgeInsets.all(0),
                margin: EdgeInsets.all(0),
                clipBehavior: Clip.hardEdge,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade500),
                ),

                child: Column(
                  children: [
                    ProfileSettingCard(
                      icon: Icons.edit_note_rounded,
                      data: 'Edit Profile',
                      onTap: () {},
                    ),
                    const Divider(),
                    ProfileSettingCard(
                      icon: Icons.notifications_none_outlined,
                      data: 'Notification Settting',
                      onTap: () {},
                    ),
                    const Divider(),
                    ProfileSettingCard(
                      icon: Icons.shield_rounded,
                      data: 'Privacy & Security',
                      onTap: () {},
                    ),
                    const Divider(),
                    ProfileSettingCard(
                      icon: Icons.favorite,
                      data: 'Dontation history',
                      onTap: () {},
                    ),
                    const Divider(),
                    ProfileSettingCard(
                      icon: Icons.settings,
                      data: 'App Setting',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 8),

            // signOut Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.all(16),

                decoration: BoxDecoration(
                  color: AppColor.kWhite,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade400, width: 1),
                ),

                child: FilledButton.icon(
                  style: FilledButton.styleFrom(
                    foregroundColor: AppColor.kred,
                    backgroundColor: AppColor.kWhite,
                    elevation: 1,
                    side: BorderSide(color: AppColor.kred),
                  ),
                  onPressed: () {},
                  label: Text(
                    "Sign Out",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  icon: Icon(Icons.logout_outlined),
                ),
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
