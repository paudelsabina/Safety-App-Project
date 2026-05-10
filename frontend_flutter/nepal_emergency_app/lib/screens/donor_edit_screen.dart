import 'package:flutter/material.dart';

class DonorEditScreen extends StatelessWidget {
  const DonorEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register Donor")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const TextField(decoration: InputDecoration(labelText: "Full Name")),
            const TextField(decoration: InputDecoration(labelText: "Blood Group")),
            const TextField(decoration: InputDecoration(labelText: "Phone Number")),
            const TextField(decoration: InputDecoration(labelText: "Location")),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFDC2626),
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text("Save", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}