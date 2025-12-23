import 'package:blood_donation/app_color.dart';
import 'package:blood_donation/ui/widgets/blood_type_drop_down_menu.dart';
import 'package:blood_donation/ui/widgets/custom_date_picker.dart';
import 'package:blood_donation/ui/widgets/gender_dropdown_card.dart';
import 'package:blood_donation/ui/widgets/register_donor_card.dart';
import 'package:flutter/material.dart';

class RegisterDonor extends StatefulWidget {
  const RegisterDonor({super.key});
  static String name = "/register-donor";

  @override
  State<RegisterDonor> createState() => _RegisterDonorState();
}

class _RegisterDonorState extends State<RegisterDonor> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _lastBlooddonation = TextEditingController();
  String? _selectedGender;
  String? _selectedBlood;

  bool isChecked = false;
  bool isChecked1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appbarBGcolor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Become a Life Saver",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              "Join our community of heros",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 8),

              // basic requirements card
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(188, 214, 255, 1),
                  borderRadius: BorderRadius.circular(16),
                  border: BoxBorder.all(width: 1, color: Colors.blue.shade800),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.shield_outlined, color: Colors.indigo),
                        const SizedBox(width: 12),
                        Text(
                          "Basic Requirements",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                            color: Colors.indigo,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    BasicRequirementCard(title: "Age between 17-65 years"),
                    BasicRequirementCard(title: "Weight at least 50 kg"),
                    BasicRequirementCard(title: "Good general health"),
                    BasicRequirementCard(
                      title: "No recent tattos or piercing(past 3 months)",
                    ),
                    BasicRequirementCard(title: "Not pregnant or nursing"),
                  ],
                ),
              ),

              //
              const SizedBox(height: 24),
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColor.kwhite,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(width: 1, color: Colors.grey.shade400),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // personal information fix
                    Row(
                      children: [
                        Icon(Icons.person_2_outlined, color: AppColor.kred),
                        const SizedBox(width: 12),
                        Text(
                          "Personal Information",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // full name
                    RegisterDonorCard(
                      label: "Full Name",
                      child: RegisterDonorFormField(
                        hintText: "Enter your full name",
                      ),
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        // email
                        Expanded(
                          child: RegisterDonorCard(
                            label: "Email",
                            child: RegisterDonorFormField(
                              hintText: "user@email.com",
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        // phone
                        Expanded(
                          child: RegisterDonorCard(
                            label: "phone",
                            child: RegisterDonorFormField(
                              hintText: "+880 123456789",
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        // Date of Birth
                        Expanded(
                          child: RegisterDonorCard(
                            label: "Date of Birth",
                            child: CustomDatePicker(
                              controller: _dateController,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        // Gender
                        Expanded(
                          child: RegisterDonorCard(
                            label: "Gender",
                            child: GenderDropdownCard(
                              value: _selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  _selectedGender = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        // Blood Type
                        Expanded(
                          child: RegisterDonorCard(
                            label: "Blood Type",
                            child: BloodTypeDropdown(
                              value: _selectedBlood,
                              onChanged: (value) {
                                _selectedBlood = value;
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        // Weight
                        Expanded(
                          child: RegisterDonorCard(
                            label: "Weight (kg)",
                            child: RegisterDonorFormField(hintText: "62"),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),
                    // address
                    RegisterDonorCard(
                      label: "Address",
                      child: RegisterDonorFormField(hintText: "Stress address"),
                    ),

                    const SizedBox(height: 8),
                    // city and zip
                    Row(
                      children: [
                        // City
                        Expanded(
                          child: RegisterDonorCard(
                            label: "City",
                            child: RegisterDonorFormField(
                              hintText: "Your city",
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        // zip code
                        Expanded(
                          child: RegisterDonorCard(
                            label: "ZIP Code",
                            child: RegisterDonorFormField(hintText: "1234"),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Divider(),
                    const SizedBox(height: 16),
                    Text(
                      "Emergency Contact",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 8),

                    // contact
                    Row(
                      children: [
                        // City
                        Expanded(
                          child: RegisterDonorCard(
                            label: "Contact Name",
                            child: RegisterDonorFormField(
                              hintText: "Emergency contact",
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        // zip code
                        Expanded(
                          child: RegisterDonorCard(
                            label: "Contact Phone",
                            child: RegisterDonorFormField(
                              hintText: "+880 123456789",
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),
                    Divider(),
                    const SizedBox(height: 16),

                    // current medical conditions
                    RegisterDonorCard(
                      label: "Current Medical Conditions (if any)",
                      child: RegisterDonorFormField(
                        maxlines: 2,
                        hintText:
                            "List any current medical conditions or write 'None' ",
                      ),
                    ),

                    // current medications
                    const SizedBox(height: 16),

                    RegisterDonorCard(
                      label: "Current Medical Conditions (if any)",
                      child: RegisterDonorFormField(
                        maxlines: 2,
                        hintText: "List current medications or write 'None' ",
                      ),
                    ),

                    const SizedBox(height: 16),
                    RegisterDonorCard(
                      label: "Last Blood Donation (if any)",
                      child: CustomDatePicker(controller: _lastBlooddonation),
                    ),
                    const SizedBox(height: 16),
                    Divider(),
                    const SizedBox(height: 16),

                    // chekpoint
                    Row(
                      children: [
                        Checkbox(
                          value: isChecked,
                          activeColor: AppColor.kred,
                          checkColor: AppColor.kwhite,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        Expanded(
                          child: Text(
                            "I agree to the terms and conditions and understand the blood donation process and requirements",
                            style: TextTheme.of(context).labelSmall,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Checkbox(
                          value: isChecked1,
                          activeColor: AppColor.kred,
                          checkColor: AppColor.kwhite,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked1 = value!;
                            });
                          },
                        ),
                        Expanded(
                          child: Text(
                            "I agree to the terms and conditions and understand the blood donation process and requirements",
                            style: TextTheme.of(context).labelSmall,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    FilledButton.icon(
                      onPressed: () {},
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColor.kred,
                        foregroundColor: AppColor.kwhite,
                        minimumSize: Size(double.maxFinite, 15),
                      ),
                      label: Text("Register as Blood Donor"),
                      icon: Icon(Icons.favorite_border_outlined),
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
}

// Basic Requirements
class BasicRequirementCard extends StatelessWidget {
  const BasicRequirementCard({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.task_alt, color: Colors.green.shade600),
        const SizedBox(width: 12),
        Text(title, style: TextStyle(color: Colors.indigo, fontSize: 15)),
      ],
    );
  }
}

// Text Form Field
class RegisterDonorFormField extends StatelessWidget {
  final TextEditingController? controller;

  final String hintText;
  final int? maxlines;

  const RegisterDonorFormField({
    super.key,
    this.controller,
    required this.hintText,
    this.maxlines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxlines,
      decoration: InputDecoration(hintText: hintText),
    );
  }
}
