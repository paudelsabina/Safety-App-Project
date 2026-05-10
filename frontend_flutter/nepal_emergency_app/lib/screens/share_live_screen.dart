import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:share_plus/share_plus.dart';

class ShareLiveScreen extends StatelessWidget {
  const ShareLiveScreen({super.key});

  Future<void> _shareLocation() async {
    Position position = await Geolocator.getCurrentPosition();
    String mapUrl = "https://www.google.com/maps/search/?api=1&query=${position.latitude},${position.longitude}";
    Share.share("I am in an emergency. My live location is: $mapUrl");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Send Live Location"),
        backgroundColor: const Color(0xFFDC2626),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.share_location, size: 100, color: Color(0xFFDC2626)),
            const SizedBox(height: 30),
            const Text(
              "Instantly share your current GPS coordinates with your emergency contacts.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFDC2626),
                minimumSize: const Size(double.infinity, 60),
              ),
              onPressed: _shareLocation,
              icon: const Icon(Icons.send, color: Colors.white),
              label: const Text("SHARE NOW", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}