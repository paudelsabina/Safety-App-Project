import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: const Color(0xFFDC2626),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          const _SettingsHeader("General"),
          _settingsTile("Language", "English / Nepali", Icons.language),
          _settingsTile("SOS Message", "Edit help message", Icons.message),
          const _SettingsHeader("Safety"),
          _settingsTile("Trusted Contacts", "Manage SMS numbers", Icons.people),
          _settingsTile(
            "GPS Refresh Rate",
            "High battery use",
            Icons.gps_fixed,
          ),
          const _SettingsHeader("About"),
          _settingsTile("Privacy Policy", "", Icons.privacy_tip),
          _settingsTile("App Version", "1.0.0", Icons.info_outline),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(context, 3),
    );
  }

  Widget _settingsTile(String title, String subtitle, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[700]),
      title: Text(title),
      subtitle: subtitle.isNotEmpty ? Text(subtitle) : null,
      trailing: const Icon(Icons.chevron_right, size: 20),
      onTap: () {},
    );
  }
}

class _SettingsHeader extends StatelessWidget {
  final String title;
  const _SettingsHeader(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
      color: Colors.grey[100],
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
