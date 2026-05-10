import 'package:flutter/material.dart';

class SirenScreen extends StatefulWidget {
  const SirenScreen({super.key});

  @override
  State<SirenScreen> createState() => _SirenScreenState();
}

class _SirenScreenState extends State<SirenScreen> with SingleTickerProviderStateMixin {
  bool _isSirenOn = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: _isSirenOn 
              ? (_controller.value > 0.5 ? Colors.red : Colors.blue) 
              : Colors.black,
          appBar: AppBar(title: const Text("Emergency Siren"), backgroundColor: Colors.transparent),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.warning, size: 120, color: _isSirenOn ? Colors.white : Colors.red),
                const SizedBox(height: 50),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  onPressed: () => setState(() => _isSirenOn = !_isSirenOn),
                  child: Text(
                    _isSirenOn ? "STOP" : "START SIREN",
                    style: const TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}