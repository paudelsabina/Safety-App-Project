import 'package:flutter/material.dart';

// 1. Import all your screen files
import 'screens/home_screen.dart';
import 'screens/flashlight_screen.dart';
import 'screens/medical_profile_screen.dart';
import 'screens/first_aid_screen.dart';
import 'screens/fake_call_screen.dart';
import 'screens/donor_screen.dart';
import 'screens/donor_edit_screen.dart';
import 'screens/check_in_screen.dart';
import 'screens/places_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/share_live_screen.dart';
import 'screens/siren_screen.dart';
import 'screens/tracking_screen.dart';
import 'screens/contact_edit_screen.dart';
import 'screens/not_found_screen.dart';

void main() {
  runApp(const NepalEmergencyApp());
}

class NepalEmergencyApp extends StatelessWidget {
  const NepalEmergencyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nepal Emergency SOS',
      debugShowCheckedModeBanner: false,

      // 2. Set the global theme to match your HTML (Red & White)
      theme: ThemeData(
        primaryColor: const Color(0xFFDC2626),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFDC2626)),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFDC2626),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),

      // 3. Define the Initial Route (The first screen the user sees)
      initialRoute: '/',

      // 4. Register all your converted HTML screens here
      routes: {
        '/': (context) => const HomeScreen(),
        '/places': (context) => const PlacesScreen(),
        '/medical-profile': (context) => const MedicalProfileScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/flashlight': (context) => const FlashlightScreen(),
        '/first-aid': (context) => const FirstAidScreen(),
        '/fake-call': (context) => const FakeCallScreen(),
        '/donors': (context) => const DonorScreen(),
        '/donor-edit': (context) => const DonorEditScreen(),
        '/contact-edit': (context) => const ContactEditScreen(),
        '/check-in': (context) => const CheckInScreen(),
        '/share-live': (context) => const ShareLiveScreen(),
        '/siren': (context) => const SirenScreen(),
        '/tracking': (context) => const TrackingScreen(),
      },

      // 5. Handle "Screen Not Found" errors
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const NotFoundScreen());
      },
    );
  }
}
