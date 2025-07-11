import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final bool isLast;
  final VoidCallback onNext;
  final VoidCallback onBack;
  final bool isFirst;
  final int currentIndex;
  final int totalPages;

  const OnboardingPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.onNext,
    required this.onBack,
    required this.currentIndex,
    required this.totalPages,
    this.isFirst = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff202020),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 40),
            Image.asset(
              'assets/images/islamiLogo.png',
              width: 291,
              height: 151,
            ),
            Image.asset(imagePath, height: 300),
            Text(
              title,
              style: const TextStyle(
                color: Color(0xffE2BE7F),
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Color(0xffE2BE7F),
                  fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back button (only if not first screen)
                  isFirst
                      ? const SizedBox(width: 60)
                      : TextButton(
                    onPressed: onBack,
                    child: const Text(
                      "Back",
                      style: TextStyle(
                        color: Color(0xffE2BE7F),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(totalPages, (index) {
                      bool isActive = index == currentIndex;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        height: 8.0,
                        width: isActive ? 20.0 : 8.0,
                        decoration: BoxDecoration(
                          color: isActive ? const Color(0xffE2BE7F) : Colors.grey,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      );
                    }),
                  ),
                  // Next / Finish button
                  TextButton(
                    onPressed: onNext,
                    child: Text(
                      isLast ? "Finish" : "Next",
                      style: const TextStyle(
                        color: Color(0xffE2BE7F),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
