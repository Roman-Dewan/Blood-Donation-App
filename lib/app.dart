
import 'package:blood_donation/app_color.dart';
import 'package:blood_donation/ui/pages/authentication/sign_in_screen.dart';
import 'package:blood_donation/ui/pages/bottom_navigation_screen.dart';
import 'package:blood_donation/ui/pages/find_screen.dart';
import 'package:blood_donation/ui/pages/history_screen.dart';
import 'package:blood_donation/ui/pages/home_screen.dart';
import 'package:blood_donation/ui/pages/profile_screen.dart';
import 'package:blood_donation/ui/pages/register_donor.dart';
import 'package:blood_donation/ui/pages/request_screen.dart';
import 'package:flutter/material.dart';

// import 'ui/screens/find_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: AppColor.schemeColor,
        scaffoldBackgroundColor: AppColor.backgroundColor,
        // button theme
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),

        // text theme
        textTheme: TextTheme(

          headlineMedium: TextStyle(color: Colors.blue),
          
          titleLarge: TextStyle(color: AppColor.whiteFontColor, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(color: AppColor.greyFontColor),
          titleSmall: TextStyle(color: AppColor.blackFontColor, fontWeight: FontWeight.bold),

          bodyLarge: TextStyle(color: AppColor.blackFontColor),
          bodyMedium: TextStyle(color: AppColor.whiteFontColor),
          bodySmall: TextStyle(fontSize: 14, color: AppColor.blackFontColor),

          labelMedium: TextStyle(color: AppColor.greyFontColor),
          labelSmall: TextStyle(color: AppColor.blackFontColor, fontSize: 12),

        ),
        
        // TextFromField theme
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.grey[200],
          filled: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          hintStyle: TextStyle(color: Colors.grey[600], fontSize: 13),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),


      ),
      routes: {
        BottomNavigationScreen.name : (context) => BottomNavigationScreen(),
        HomeScreen.name :(context) => const HomeScreen(),
        FindScreen.name :(context) => const FindScreen(),
        RequestScreen.name :(context) => const RequestScreen(),
        HistoryScreen.name :(context) => const HistoryScreen(),
        ProfileScreen.name :(context) => const ProfileScreen(),
        RegisterDonor.name :(context) => const RegisterDonor(),
        SignInScreen.name : (context) => const SignInScreen()
      },
      initialRoute: SignInScreen.name,
      debugShowCheckedModeBanner: false,
    );
  }
}
