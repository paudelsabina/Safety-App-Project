import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _makeCall(String number) async {
    final Uri url = Uri.parse('tel:$number');
    if (await canLaunchUrl(url)) await launchUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nepal Emergency SOS", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFFDC2626),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none, color: Colors.white))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Center(
              child: Container(
                width: 160, height: 160,
                decoration: BoxDecoration(
                  color: const Color(0xFFDC2626),
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(color: Colors.red.withOpacity(0.3), blurRadius: 15, spreadRadius: 5)],
                ),
                child: const Center(
                  child: Text("HELP", style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            const SizedBox(height: 30),
            _buildEmergencyTile("Police", "100", Icons.local_police),
            _buildEmergencyTile("Ambulance", "102", Icons.medical_services),
            _buildEmergencyTile("Fire Brigade", "101", Icons.fire_truck),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                children: [
                  _menuItem(context, "First Aid", Icons.healing, '/first-aid'),
                  _menuItem(context, "Blood Donors", Icons.bloodtype, '/donors'),
                  _menuItem(context, "Check-in", Icons.timer, '/check-in'),
                  _menuItem(context, "Flashlight", Icons.flashlight_on, '/flashlight'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(context, 0),
    );
  }

  Widget _buildEmergencyTile(String name, String num, IconData icon) {
    return ListTile(
      leading: CircleAvatar(backgroundColor: Colors.red[50], child: Icon(icon, color: const Color(0xFFDC2626))),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
      trailing: Text(num, style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
      onTap: () => _makeCall(num),
    );
  }

  Widget _menuItem(BuildContext context, String title, IconData icon, String route) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey[200]!), borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, route),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: Colors.grey[700]),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}

// Reusable Bottom Navigation Logic for all main screens
Widget _buildBottomNav(BuildContext context, int currentIndex) {
  return BottomNavigationBar(
    currentIndex: currentIndex,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: const Color(0xFFDC2626),
    unselectedItemColor: Colors.grey,
    onTap: (index) {
      if (index == 0) Navigator.pushReplacementNamed(context, '/');
      if (index == 1) Navigator.pushReplacementNamed(context, '/places');
      if (index == 2) Navigator.pushReplacementNamed(context, '/medical-profile');
      if (index == 3) Navigator.pushReplacementNamed(context, '/settings');
    },
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.place), label: "Places"),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
    ],
  );
}