import 'package:flutter/material.dart';
import 'package:islami/onboardingScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _showOnboarding = true;

  // @override
  // void initState() {
  //   super.initState();
  //   _checkFirstRun();
  // }
  //
  // Future<void> _checkFirstRun() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   bool? seen = prefs.getBool('onboarding_seen');
  //
  //   setState(() {
  //     _showOnboarding = seen == null || seen == false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen()
      // _showOnboarding ? const OnboardingScreen() : MainScreen(),
    );
  }
}
