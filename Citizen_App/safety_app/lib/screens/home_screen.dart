import 'package:flutter/material.dart';
import '../widgets/sos_button.dart';
import '../services/api_service.dart';
import '../model/emergency_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService apiService = ApiService();

  Future<void> triggerEmergency() async {
    // FIXED: Changed print to debugPrint
    debugPrint("Long press detected! Sending SOS...");

    Emergency newAlert = Emergency(
      type: "High Alert",
      lat: 27.7172,
      long: 85.3240,
    );

    await apiService.sendEmergency(newAlert);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Emergency Alert Sent to Server!"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "SafeZone",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 41, 199, 6),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.notifications_none_outlined,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 15),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.greenAccent[400],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Hi, Sabina!",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // FIXED: Added const here
                    const Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Color.fromARGB(255, 221, 189, 5),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "You're near: Sukuna Campus Gate",
                          style: TextStyle(
                            color: Color.fromARGB(255, 5, 144, 199),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 15),
                    _buildContactAvatar("Kevin", Colors.blue[300]),
                    _buildContactAvatar("Amber", Colors.pink[300]),
                    _buildContactAvatar("Rasheed & Josh", Colors.teal[300]),
                    _buildContactAvatar("Jacob", Colors.purple[300]),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onLongPress: triggerEmergency,
                  child: const SOSButton(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactAvatar(String name, Color? color) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          CircleAvatar(radius: 35, backgroundColor: color),
          const SizedBox(height: 5),
          Text(name, style: TextStyle(fontSize: 12, color: Colors.grey[700])),
        ],
      ),
    );
  }
}
