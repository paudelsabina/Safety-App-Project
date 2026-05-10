import 'package:flutter/material.dart';

class FakeCallScreen extends StatelessWidget {
  const FakeCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Column(
            children: [
              Text("Home", style: TextStyle(color: Colors.white, fontSize: 32)),
              SizedBox(height: 10),
              Text("Calling...", style: TextStyle(color: Colors.white70, fontSize: 18)),
            ],
          ),
          const CircleAvatar(radius: 60, backgroundColor: Colors.grey, child: Icon(Icons.person, size: 80, color: Colors.white)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _callBtn(Icons.call_end, "Decline", Colors.red, () => Navigator.pop(context)),
              _callBtn(Icons.call, "Accept", Colors.green, () {}),
            ],
          )
        ],
      ),
    );
  }

  Widget _callBtn(IconData icon, String label, Color color, VoidCallback onTap) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: CircleAvatar(radius: 35, backgroundColor: color, child: Icon(icon, color: Colors.white, size: 30)),
        ),
        const SizedBox(height: 10),
        Text(label, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}