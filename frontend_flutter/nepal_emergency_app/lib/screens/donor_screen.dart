import 'package:flutter/material.dart';

class DonorScreen extends StatelessWidget {
  const DonorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blood Donors"),
        backgroundColor: const Color(0xFFDC2626),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.bloodtype, size: 80, color: Colors.grey[300]),
              const SizedBox(height: 16),
              const Text(
                "No donors saved. Tap Add donor to register the first one.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(context, '/donor-edit'),
        label: const Text("Add donor"),
        icon: const Icon(Icons.add),
        backgroundColor: const Color(0xFFDC2626),
      ),
    );
  }
}