import 'package:flutter/material.dart';
import 'package:weather_info/screens/settings_screen.dart';

import 'forecast_screen.dart';
import 'home_screeen.dart';
import 'search._screen.dart';

class NavbarScreen extends StatefulWidget {
  const NavbarScreen({super.key});

  @override
  State<NavbarScreen> createState() => _NavbarScreenState();
}

class _NavbarScreenState extends State<NavbarScreen> {
  int _currentIndex = 0;

  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      const HomeScreen(),
      const SearchScreen(),
      const ForecastScreen(),
      const SettingsScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff060720),
      body: pages.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff060720),
        currentIndex: _currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.grey.withOpacity(0.5),
            ),
            activeIcon: const Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.grey.withOpacity(0.5),
            ),
            activeIcon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.line_axis_outlined,
              color: Colors.grey.withOpacity(0.5),
            ),
            activeIcon: const Icon(
              Icons.line_axis_outlined,
              color: Colors.white,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: Colors.grey.withOpacity(0.5),
            ),
            activeIcon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
