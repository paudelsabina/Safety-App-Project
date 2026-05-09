import 'dart:convert';
import 'package:flutter/foundation.dart'; // REQUIRED for debugPrint
import '../model/emergency_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  // Use your computer's IP address if testing on a real phone!
  final String baseUrl = "http://127.0.0.1:8000/api/alerts/";

  Future<void> sendEmergency(Emergency emergency) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(emergency.toJson()),
      );

      if (response.statusCode == 201) {
        // FIXED: Changed print to debugPrint
        debugPrint("SOS Sent Successfully!");
      } else {
        // FIXED: Changed print to debugPrint
        debugPrint("Failed to send SOS: ${response.body}");
      }
    } catch (e) {
      // FIXED: Changed print to debugPrint
      debugPrint("Error connecting to server: $e");
    }
  }
}
