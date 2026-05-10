import 'package:flutter/material.dart';

class ContactEditScreen extends StatelessWidget {
  const ContactEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Emergency Contact")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TextField(decoration: InputDecoration(labelText: "Contact Name")),
            const TextField(decoration: InputDecoration(labelText: "Phone Number")),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFDC2626),
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text("Save Contact", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}