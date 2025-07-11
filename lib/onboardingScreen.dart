import 'package:flutter/material.dart';
import 'package:islami/main_screen.dart';
import 'package:islami/onboardingPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> pages = [
    {
      "image": "assets/images/intro1.png",
      "title": "Welcome To Islami App",
      "description": ""
    },
    {
      "image": "assets/images/intro2.png",
      "title": "Welcome To Islami",
      "description": "We Are Very Excited To Have You In Our Community"
    },
    {
      "image": "assets/images/intro3.png",
      "title": "Reading the Quran",
      "description": "Read, and your Lord is the Most Generous"
    },
    {
      "image": "assets/images/intro4.png",
      "title": "Bearish",
      "description": "Praise the name of your Lord, the Most High"
    },
    {
      "image": "assets/images/intro5.png",
      "title": "Holy Quran Radio",
      "description":
      "You can listen to the Holy Quran Radio through the application for free and easily"
    },
  ];

  void _nextPage() async {
    if (_currentPage < pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      // Save onboarding flag
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('onboarding_seen', true);

      // Navigate to MainScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => MainScreen()),
      );
    }
  }


  void _previousPage() {
    if (_currentPage > 0) {
      _controller.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        itemCount: pages.length,
        onPageChanged: (index) => setState(() => _currentPage = index),
        itemBuilder: (context, index) {
          final page = pages[index];
          return OnboardingPage(
            imagePath: page['image']!,
            title: page['title']!,
            description: page['description']!,
            onNext: _nextPage,
            onBack: _previousPage,
            isLast: index == pages.length - 1,
            isFirst: index == 0,
            currentIndex: _currentPage,
            totalPages: pages.length,
          );
        },
      ),
    );
  }
}
