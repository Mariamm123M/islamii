import 'package:flutter/material.dart';

class RadioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Stack(
        children: [
          Positioned.fill(
            top: 130,
            right: 50,
            child: Opacity(
              opacity: 0.5,
              child: Transform.scale(
                scale: 1.3,
                child: Image.asset(
                  'assets/images/radio_bg.png',
                  fit: BoxFit.cover, // Ensures proper scaling without distortion
                ),
              ),
            ),
          ),

          // Optional: Black overlay if needed
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.1),
                  Colors.black.withOpacity(0.7),
                ],
              ),
            ),
          ),

          // Foreground content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Image.asset('assets/images/islamiLogo.png')),
                  SizedBox(height: 5),

                  // Tab Selector
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 40,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                          decoration: BoxDecoration(
                            color: Color(0xFFE2BE7F),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              'Radio',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                          decoration: BoxDecoration(
                            color: Color(0xFF202020).withOpacity(0.7),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              'Reciters',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 15),

                  // Radio Items
                  Expanded(
                    child: ListView(
                      children: [
                        buildRadioCard(title: 'Radio Ibrahim Al-Akdar', isPlaying: false, isMuted: false),
                        buildRadioCard(title: 'Radio Al-Qaria Yassen', isPlaying: true, isMuted: true),
                        buildRadioCard(title: 'Radio Ahmed Al-trabulsi', isPlaying: false, isMuted: false),
                        buildRadioCard(title: 'Radio Addokali Mohammad Alalim', isPlaying: false, isMuted: false),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),


      // Bottom Navigation
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   backgroundColor: Color(0xFFE2BE7F),
      //   selectedItemColor: Colors.white,
      //   unselectedItemColor: Color(0xFF202020),
      //   currentIndex: 3, // Radio tab index
      //   onTap: (index) {
      //     // Navigation logic here
      //   },
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Image.asset('assets/icons/Helal.png',
      //           width: 19, height: 22, color: Color(0xFF202020)),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Image.asset('assets/icons/saved.png',
      //           width: 22, height: 22, color: Color(0xFF202020)),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Image.asset('assets/icons/sebha_icon.png',
      //           width: 26, height: 26, color: Color(0xFF202020)),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Image.asset('assets/icons/radio.png',
      //           width: 26, height: 23, color: Colors.white),
      //       label: 'Radio',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Image.asset('assets/icons/time.png',
      //           width: 27, height: 27, color: Color(0xFF202020)),
      //       label: '',
      //     ),
      //   ],
      // ),
    );
  }

  Widget buildRadioCard({
    required String title,
    required bool isPlaying,
    required bool isMuted,
  }) {
    return Container(
      height: 120,
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Color(0xFFE2BE7F),
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage('assets/images/Mosque.png'),
          opacity: 0.3,
          fit: BoxFit.cover,
          alignment: Alignment.bottomCenter, // Stick image to bottom
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
          ),

        // Control Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
              color: Colors.black,
              size: 44,
            ),
          SizedBox(width: 10),
          // Icon(
          isMuted
              ? Image.asset('assets/icons/VolumeCross.png', width: 24, height: 24)
              : Image.asset('assets/icons/VolumeHigh.png', width: 24, height: 24),
        // ),
            ],
        ),
      ],
            )
    );
  }
}
