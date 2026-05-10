import 'package:flutter/material.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Travel Guard"), backgroundColor: const Color(0xFFDC2626), foregroundColor: Colors.white),
      body: Column(
        children: [
          Container(
            height: 300,
            color: Colors.grey[200],
            child: const Center(child: Text("Map View Loading...", style: TextStyle(color: Colors.grey))),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Live Status", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const ListTile(
                    leading: Icon(Icons.my_location, color: Colors.green),
                    title: Text("Tracking Active"),
                    subtitle: Text("Updating location every 30 seconds"),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.black, minimumSize: const Size(double.infinity, 50)),
                    onPressed: () => Navigator.pop(context),
                    child: const Text("STOP TRACKING", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}