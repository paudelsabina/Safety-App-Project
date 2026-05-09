import 'package:flutter/material.dart';
import 'screens/main_nav_wrapper.dart'; // This connects to your screens folder

void main() {
  runApp(const EmergencyApp());
}

class EmergencyApp extends StatelessWidget {
  const EmergencyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Removes the "Debug" banner
      title: 'Safely Connect',
      theme: ThemeData(
        primarySwatch: Colors.red,
        useMaterial3: true, // Makes the app look modern
      ),
      home: const MainNavWrapper(), // This launches your new home_screen.dart
    );
  }
}
