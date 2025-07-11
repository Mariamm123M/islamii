import 'dart:math' as Math;
import 'package:flutter/material.dart';

class SebhaScreen extends StatefulWidget {
  @override
  _SebhaScreenState createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int counter = 0;
  int _selectedIndex = 2;
  final List<String> tasbeehPhrases = ["سبحان الله", "الحمد لله", "الله أكبر"];
  int phraseIndex = 0;

  void incrementCounter() {
    setState(() {
      counter++;
      if (counter == 33) {
        counter = 0;
        phraseIndex = (phraseIndex + 1) % tasbeehPhrases.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/sebha_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),


          // Gradient Opacity Overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xff202020).withOpacity(0.4),
                  Colors.black.withOpacity(1),
                ],
              ),
            ),
          ),

          // Main Content
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/islamiLogo.png'),
                  SizedBox(height: 20),
                  Text(
                    'سَبِّحِ اسْمَ رَبِّكَ الْأَعْلَى',
                    style: TextStyle(
                      fontSize: 36,
                      color: Colors.white,
                      fontFamily: 'Janna LT',
                    ),
                  ),
                  SizedBox(height: 40),
                  GestureDetector(
                    onTap: incrementCounter,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 250,
                          height: 250,
                          child: CustomPaint(
                            painter: BeadsPainter(),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              tasbeehPhrases[phraseIndex],
                              style:
                              TextStyle(fontSize: 36, color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '$counter',
                              style:
                              TextStyle(fontSize: 36, color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed, // REQUIRED when using >3 items
      //   backgroundColor: Color(0xFFE2BE7F),
      //   selectedItemColor: Colors.white,
      //   unselectedItemColor: Color(0xFF202020),
      //   currentIndex: _selectedIndex,
      //   onTap: (index) {
      //     setState(() {
      //       _selectedIndex = index;
      //     });
      //   },
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Image.asset(
      //         'assets/icons/Helal.png',
      //         width: 19,
      //         height: 22,
      //         color: _selectedIndex == 0 ? Colors.white : Color(0xFF202020),
      //       ),
      //       label: "",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Image.asset(
      //         'assets/icons/saved.png',
      //         width: 22,
      //         height: 22,
      //         color: _selectedIndex == 1 ? Colors.white : Color(0xFF202020),
      //       ),
      //       label: "",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Image.asset(
      //         'assets/icons/sebha_icon.png',
      //         width: 26,
      //         height: 26,
      //         color: _selectedIndex == 2 ? Colors.white : Color(0xFF202020),
      //       ),
      //       label: "Hadith",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Image.asset(
      //         'assets/icons/radio.png',
      //         width: 26,
      //         height: 23,
      //         color: _selectedIndex == 3 ? Colors.white : Color(0xFF202020),
      //       ),
      //       label: "",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Image.asset(
      //         'assets/icons/time.png',
      //         width: 22,
      //         height: 22,
      //         color: _selectedIndex == 4 ? Colors.white : Color(0xFF202020),
      //       ),
      //       label: "",
      //     ),
      //   ],
      // ),
    );
  }
}

// Custom Beads Painter
class BeadsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0xFFE2B96C)
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2.5;

    for (int i = 0; i < 33; i++) {
      final angle = (2 * Math.pi / 33) * i;
      final offset = Offset(
        center.dx + radius * Math.cos(angle),
        center.dy + radius * Math.sin(angle),
      );
      canvas.drawCircle(offset, 10, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
