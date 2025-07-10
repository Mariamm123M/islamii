import 'package:flutter/material.dart';
import 'sebha_screen.dart';
import 'radio_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // List of your screens
  final List<Widget> _screens = [
    SebhaScreen(),
    RadioScreen(),
    // Add more screens if needed
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFFE2BE7F),
        selectedItemColor: Colors.white,
        unselectedItemColor: Color(0xFF202020),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/sebha_icon.png',
              width: 26,
              height: 26,
              color: _selectedIndex == 0 ? Colors.white : Color(0xFF202020),
            ),
            label: 'Sebha',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/radio.png',
              width: 26,
              height: 23,
              color: _selectedIndex == 1 ? Colors.white : Color(0xFF202020),
            ),
            label: 'Radio',
          ),
        ],
      ),
    );
  }
}
