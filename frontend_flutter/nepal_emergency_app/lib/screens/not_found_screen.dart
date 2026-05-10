import 'package:flutter/material.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("404", style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
            const Text("This screen doesn't exist."),
            TextButton(
              onPressed: () => Navigator.pushReplacementNamed(context, '/'),
              child: const Text("Go to home screen!", style: TextStyle(color: Color(0xFFDC2626))),
            ),
          ],
        ),
      ),
    );
  }
}