import 'package:flutter/material.dart';

class FirstAidScreen extends StatelessWidget {
  const FirstAidScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Aid Guide"),
        backgroundColor: const Color(0xFFDC2626),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _aidTile("CPR", "Push hard and fast in the center of the chest. 100-120 compressions per minute."),
          _aidTile("Choking", "Give 5 back blows and 5 abdominal thrusts (Heimlich maneuver)."),
          _aidTile("Severe Bleeding", "Apply direct pressure with a clean cloth. Elevate the wound."),
          _aidTile("Burns", "Run cool water over the burn for at least 10 minutes. Cover loosely."),
          _aidTile("Fractures", "Immobilize the area. Do not try to realign the bone."),
        ],
      ),
    );
  }

  Widget _aidTile(String title, String desc) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ExpansionTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFDC2626))),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(desc, style: const TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}