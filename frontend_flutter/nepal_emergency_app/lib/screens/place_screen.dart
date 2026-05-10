import 'package:flutter/material.dart';
// To use the BottomNav

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nearby Help"),
        backgroundColor: const Color(0xFFDC2626),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _placeCategory("Hospitals", Icons.local_hospital),
          _placeCategory("Police Stations", Icons.security),
          _placeCategory("Pharmacies", Icons.local_pharmacy),
          _placeCategory("Blood Banks", Icons.bloodtype),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(context, 1),
    );
  }

  Widget _placeCategory(String title, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFFDC2626)),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {}, // Integration with Google Maps would go here
      ),
    );
  }
}
