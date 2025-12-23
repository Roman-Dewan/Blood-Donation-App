import 'package:blood_donation/app_color.dart';
import 'package:blood_donation/ui/widgets/custom_check_box.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'label_card.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static String name = "/sign-in";

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isCheckedBox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 78),

              /// Top part for welcome and logo
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(color: AppColor.backgroundColor),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColor.kred,
                      child: Icon(Icons.favorite, color: AppColor.backgroundColor),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Welcome back",
                      style: TextTheme.of(
                        context,
                      ).titleLarge?.copyWith(color: AppColor.kred),
                    ),
                    Text(
                      "Sign in to continue saving lives",
                      style: TextTheme.of(
                        context,
                      ).bodySmall?.copyWith(color: AppColor.kgrey),
                    ),
                  ],
                ),
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
                      "Sign in",
                      style: TextTheme.of(
                        context,
                      ).bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Enter your credentials to access your account",
                      style: TextTheme.of(
                        context,
                      ).bodyLarge?.copyWith(color: AppColor.kgrey),
                    ),
                    const SizedBox(height: 24),
                    // Email field
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

                    /// password
                    LabelCard(
                      label: "Password",
                      icon: Icons.lock_outline,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter your password",
                          suffixIcon: Icon(Icons.remove_red_eye),
                        ),
                      ),
                    ),

                    /// Remember and forget
                    Row(
                      children: [
                        /// check box with label text
                        CustomCheckBox(
                          value: isCheckedBox,
                          onChanged: (value) {
                            setState(() {
                              isCheckedBox = value!;
                            });
                          },
                          label: "Remember me",
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: _onTapForgetButton,
                          child: Text(
                            "forget password?",
                            style: TextStyle(color: AppColor.kred),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    /// Sign in Button
                    FilledButton(
                      onPressed: _onTapSignInButton,
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColor.kred,
                        foregroundColor: AppColor.kWhite,
                        minimumSize: Size(double.maxFinite, 45),
                      ),
                      child: Text("Sign in"),
                    ),

                    const SizedBox(height: 24),

                    /// Sign up
                    Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: "Don't have an account? ",
                          style: TextTheme.of(
                            context,
                          ).bodyMedium?.copyWith(color: AppColor.kblack),
                          children: [
                            TextSpan(
                              text: "Sign Up",
                              style: TextTheme.of(context).bodyMedium?.copyWith(
                                color: AppColor.kred,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                  ..onTap = _onTapSignUpButton
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),
              /// Why blood connect

              Container(
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(width: 1, color: AppColor.kred)
                ),
                child: ListTile(
                  leading: Icon(Icons.favorite_border_outlined, color: AppColor.kred,),
                  title: Text("Why BloodConnect?", style: TextTheme.of(context).bodyLarge?.copyWith(color: AppColor.kred, fontWeight: FontWeight.bold),),
                  subtitle: Text("Join thousands of donors making a difference. Your donation can save up to 3 lives.",style: TextTheme.of(context).bodyMedium?.copyWith(color: AppColor.kblack)),
                ),
              ),

              const SizedBox(height: 72),

              /// Terms and Service

              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "By Signing in, you agree to our ",
                    style: TextTheme.of(
                      context,
                    ).bodyMedium?.copyWith(color: AppColor.kgrey),

                    children: [
                      TextSpan(
                        text: "Terms of Services",
                        style: TextTheme.of(context).bodyMedium?.copyWith(
                          color: AppColor.kred,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.red,
                          decorationThickness: 3
                        ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = _onTapTermsCondition
                      ),
                      TextSpan(
                        text: " and ",style: TextTheme.of(
                        context,
                      ).bodyMedium?.copyWith(color: AppColor.kgrey),
                      ),
                      TextSpan(
                        text: "Privacy Policy",
                        style: TextTheme.of(context).bodyMedium?.copyWith(
                            color: AppColor.kred,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.red,
                            decorationThickness: 3
                        ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = _onTapPrivacyPolicy
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

void _onTapSignInButton() { debugPrint("tap on sign In button");}
void _onTapSignUpButton() {debugPrint("tap on sign up button");}
void _onTapForgetButton() {debugPrint("tap on forget button");}
void _onTapPrivacyPolicy() {debugPrint("tap on Privacy Policy");}
void _onTapTermsCondition() {debugPrint("tap on Terms Condition");}

// label part for Text Form Field
