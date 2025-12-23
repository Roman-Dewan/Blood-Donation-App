import 'package:blood_donation/app_color.dart';
import 'package:blood_donation/ui/pages/find_screen.dart';
import 'package:blood_donation/ui/pages/history_screen.dart';
import 'package:blood_donation/ui/pages/home_screen.dart';
import 'package:blood_donation/ui/pages/profile_screen.dart';
import 'package:blood_donation/ui/pages/request_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});
  static String name = "/main-bottom-nav";

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {

  int currentPageIndex = 0;
  
  List<Widget> pages = [
    HomeScreen(),
    FindScreen(),
    RequestScreen(),
    HistoryScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(

        onDestinationSelected: (int index) {
          currentPageIndex = index;
          setState(() {});
        },

        selectedIndex: currentPageIndex,
        elevation: 0,

        backgroundColor: AppColor.kwhite,
        indicatorColor: Colors.red.shade400,
        

        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), selectedIcon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.search), label: "Find"),
          NavigationDestination(icon: Icon(Icons.favorite), label: "Request"),
          NavigationDestination(icon: Icon(Icons.history), label: "History"),
          NavigationDestination(icon: Icon(Icons.person_2_outlined), label: "Person"),
        ],
      ),

      body: pages[currentPageIndex],
    );
  }
}
