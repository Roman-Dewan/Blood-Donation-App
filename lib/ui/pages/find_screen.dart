import 'package:blood_donation/app_color.dart';
import 'package:blood_donation/ui/widgets/blood_type_drop_down_menu.dart';
import 'package:flutter/material.dart';
import '../widgets/donor_card.dart';

class FindScreen extends StatefulWidget {
  const FindScreen({super.key});

  static String name = "/find-screen";

  @override
  State<FindScreen> createState() => _FindScreenState();
}

class _FindScreenState extends State<FindScreen> {
  String? _selectedBloodType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section.
              Text(
                "Find Blood Donors",
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              // search bar
              SearchBar(),

              // select blood type - drop down menu
              const SizedBox(height: 8),

              SizedBox(
                width: 200,
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

              const SizedBox(height: 16),
              // Divider
              const Divider(
                color: AppColor.kblack, // Light grey line
                thickness: 1,
              ),

              const SizedBox(height: 8),

              // Found donors numbers & sort distance
              Row(
                children: [
                  Text(
                    "Found 4 Donors near You",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Spacer(),
                  Icon(Icons.location_on_outlined, color: AppColor.greyIconColor),
                  const SizedBox(width: 4),
                  Text(
                    "Sort by Distance",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Donor card
              Expanded(
                child: ListView.separated(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return DonorCard(
                      bloodGroup: 'O+',
                      name: 'Md Roman Dewan',
                      rating: '4.5',
                      hospitalName: 'City Hospital',
                      distance: '1.7',
                      status: 'Available',
                      statusColor: AppColor.statusGreenC,
                      noOfDontation: 4,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 12);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Search Bar
class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              fillColor: Colors.grey[300],
              filled: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),

              prefixIcon: Icon(Icons.search_rounded),
              hintText: "Search By Location..",
            ),
          ),
        ),

        const SizedBox(width: 8),

        Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColor.kwhite,
            border: Border.all(width: 1, color: AppColor.kblack),
          ),
          child: Icon(Icons.filter_alt_outlined, size: 20),
        ),
      ],
    );
  }
}
