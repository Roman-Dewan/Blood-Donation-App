import 'package:blood_donation/app_color.dart';
import 'package:blood_donation/ui/widgets/blood_type_drop_down_menu.dart';
import 'package:blood_donation/ui/widgets/custom_date_picker.dart';
import 'package:blood_donation/ui/widgets/request_blood_card.dart';
import 'package:blood_donation/ui/widgets/request_urgency_level_dropdown.dart';
import 'package:flutter/material.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key});
  static String name = "/request-screen";

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  final TextEditingController _dateController = TextEditingController();
  String? _selectedBloodType;
  String? _selectedUrgency;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kred,
        elevation: 4,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
        ),

        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Request Blood",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              "Every reqeust helps save a life",
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: AppColor.kwhite),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            children: [
              const SizedBox(height: 8),

              // Emergency Section. - fix not changeable
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 247, 230, 232),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.red.shade500, width: 1),
                ),

                child: ListTile(
                  leading: Icon(Icons.warning_amber_rounded, color: AppColor.kred),
                  title: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Emergency? ",
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(
                                color: AppColor.kred,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        TextSpan(
                          text:
                              "For critical sitatuations, Please contact emergency services immediately at 999.",
                          style: Theme.of(
                            context,
                          ).textTheme.labelMedium?.copyWith(color: AppColor.kred),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Blood Request Details
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.all(16),

                decoration: BoxDecoration(
                  color:  AppColor.kwhite,
                  border: Border.all(color: Colors.grey.shade500, width: 1),
                  borderRadius: BorderRadius.circular(16),
                ),

                child: Column(
                  children: [
                    // header section. [fix part]
                    Row(
                      children: [
                        Icon(Icons.favorite_border_outlined, color:  AppColor.kred),
                        const SizedBox(width: 8),
                        Text(
                          "Blood Request Details.",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    RequestBloodCard(
                      label: "Patient Name",
                      child: ReqFormField(
                        hintText: "Enter Patient's full name",
                      ),
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        Expanded(
                          child: RequestBloodCard(
                            label: "Blood Type Requried",
                            child: BloodTypeDropdown(
                              value: _selectedBloodType,
                              onChanged: (value) {
                                setState(() {
                                  _selectedBloodType = value;
                                });

                                debugPrint("Selected blood type: $value");
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: RequestBloodCard(
                            label: "Units Needed",
                            child: ReqFormField(hintText: "e.g. 2",),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    RequestBloodCard(
                      label: "Hospital/Medical center",
                      child: ReqFormField(hintText: "Enter Hopital name",),
                    ),

                    const SizedBox(height: 8),

                    RequestBloodCard(
                      label: "Contact Phone",
                      child: ReqFormField(hintText: "+880 123456789"),
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        Expanded(
                          child: RequestBloodCard(
                            label: "Urgency Level",
                            child: RequestUrgencyLevelDropdown(
                              value: _selectedUrgency,
                              onChanged: (value) {
                                setState(() {
                                  _selectedUrgency = value;
                                });

                                debugPrint("Selected urgency level: $value");
                              },
                            ),
                          ),
                        ),

                        const SizedBox(width: 4),

                        Expanded(
                          child: RequestBloodCard(
                            label: "Needed by",
                            child: CustomDatePicker(
                              controller: _dateController,
                            ),
                          ),
                        )

                      ],
                    ),

                    const SizedBox(height: 8),
                    RequestBloodCard(
                      label: "Additional Notes (optional)",
                      child: ReqFormField(
                        hintText:
                            "Any additional information that might help donors",
                        maxlines: 4,
                      ),
                    ),

                    // done form

                    // button
                    const SizedBox(height: 20),

                    FilledButton(
                      style: FilledButton.styleFrom(
                        minimumSize: Size(double.maxFinite, 8),
                        backgroundColor:  AppColor.kred,
                        foregroundColor:  AppColor.kwhite,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide.none,
                        ),
                      ),
                      onPressed: () {},
                      child: Text("Submit Blood Request"),
                    ),

                    const SizedBox(height: 8),
                    FilledButton(
                      style: FilledButton.styleFrom(
                        minimumSize: Size(double.maxFinite, 8),
                        backgroundColor: AppColor.kwhite,
                        foregroundColor: AppColor.kblack,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),

                          side: BorderSide(
                            color: Colors.grey.shade500,
                            width: 1,
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Text("Find Donors Directly"),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              /// What happens next
              Container(
                padding: EdgeInsets.all(16),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: AppColor.kwhite,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(width: 1, color: Colors.grey.shade500),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "What happens next?",
                      style: Theme.of(
                        context,
                      ).textTheme.titleLarge?.copyWith(color: AppColor.kblack),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "• Compatible donors in your area will be notified",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      "• You'll recieve contact details of interested donors",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      "• Follow up directly with donors to coordinate",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      "• Track the progress in your request history",
                      style: Theme.of(context).textTheme.bodySmall,
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


  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }
}

// In file widget
class ReqFormField extends StatelessWidget {
  final TextEditingController? controller;

  final String hintText;
  final int? maxlines;

  const ReqFormField({
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
