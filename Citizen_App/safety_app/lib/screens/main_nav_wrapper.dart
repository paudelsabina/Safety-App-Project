import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'home_screen.dart';

class MainNavWrapper extends StatefulWidget {
  const MainNavWrapper({super.key});

  @override
  State<MainNavWrapper> createState() => _MainNavWrapperState();
}

class _MainNavWrapperState extends State<MainNavWrapper> {
  int _currentIndex = 0;

  // This list holds the different pages
  final List<Widget> _pages = [
    HomeScreen(),
    const Center(child: Text("Contacts Page")),
    const Center(child: Text("Map Page")),
    const Center(child: Text("Profile Page")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // This makes the nav bar look "floating"
      body: _pages[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: const Color.fromARGB(255, 83, 129, 215),
        buttonBackgroundColor: const Color.fromARGB(255, 82, 131, 217),
        height: 65,
        items: const [
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.people, color: Colors.white),
          Icon(Icons.location_on, color: Colors.white),
          Icon(Icons.person, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
