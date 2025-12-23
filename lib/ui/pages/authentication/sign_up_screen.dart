import 'package:blood_donation/ui/widgets/blood_type_drop_down_menu.dart';
import 'package:flutter/material.dart';

import '../../../app_color.dart';
import 'label_card.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static String name = "/sign-up";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? _selectedBloodType;
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Account"),
        centerTitle: true,
        backgroundColor: AppColor.kred,
      ),
      body: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(color: AppColor.backgroundColor),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: AppColor.kred,
                        child: Icon(
                          Icons.favorite,
                          color: AppColor.backgroundColor,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Join BloodConnect",
                        style: TextTheme.of(
                          context,
                        ).titleLarge?.copyWith(color: AppColor.kred),
                      ),
                      Text(
                        "Become a hero and save lives toady",
                        style: TextTheme.of(
                          context,
                        ).bodySmall?.copyWith(color: AppColor.kgrey),
                      ),

                      const SizedBox(height: 24),

                      // Sign in Form
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColor.kWhite,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sign Up",
                              style: TextTheme.of(context).bodyLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Create your account to start donating",
                              style: TextTheme.of(
                                context,
                              ).bodyLarge?.copyWith(color: AppColor.kgrey),
                            ),
                            const SizedBox(height: 24),

                            /// Full name
                            LabelCard(
                              label: "Full Name",
                              icon: Icons.person_outline,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Enter your Full Name",
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),

                            /// Email field
                            LabelCard(
                              label: "Email Address",
                              icon: Icons.email_outlined,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Enter your email",
                                ),
                              ),
                            ),

                            const SizedBox(height: 8),

                            /// Phone Number
                            LabelCard(
                              label: "Phone Number",
                              icon: Icons.phone_outlined,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "+880 123456789",
                                ),
                              ),
                            ),

                            const SizedBox(height: 8),

                            /// Blood Type
                            LabelCard(
                              label: "Blood Type",
                              icon: Icons.water_drop_outlined,
                              child: BloodTypeDropdown(
                                value: _selectedBloodType,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedBloodType = value;
                                  });
                                },
                              ),
                            ),

                            const SizedBox(height: 8),

                            /// password
                            LabelCard(
                              label: "Password",
                              icon: Icons.lock_outline,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Create a Strong password",
                                  suffixIcon: Icon(Icons.remove_red_eye),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),

                            /// password
                            LabelCard(
                              label: "Confirm Password",
                              icon: Icons.lock_outline,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Re-entered your password",
                                  suffixIcon: Icon(Icons.remove_red_eye),
                                ),
                              ),
                            ),


                            const SizedBox(height: 16),
                            FilledButton(
                              onPressed: _onTapSignUpButton,
                              style: FilledButton.styleFrom(
                                backgroundColor: AppColor.kred,
                                foregroundColor: AppColor.kWhite,
                                minimumSize: Size(double.maxFinite, 45),
                              ),
                              child: Text("Sign in"),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),
                      /// sign up button

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _onTapSignUpButton() {
    debugPrint("tap on sign up button");
  }
}
