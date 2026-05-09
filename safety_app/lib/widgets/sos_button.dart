import 'package:flutter/material.dart';

class SOSButton extends StatefulWidget {
  const SOSButton({super.key});

  @override
  State<SOSButton> createState() => _SOSButtonState();
}

class _SOSButtonState extends State<SOSButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
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
        return Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                // FIXED: Removed the stray Color.fromARGB and fixed withValues
                color: Colors.red.withValues(
                  alpha: 0.5 - (_controller.value * 0.5),
                ),
                spreadRadius: _controller.value * 50,
                blurRadius: 15,
              ),
            ],
          ),
          child: const CircleAvatar(
            backgroundColor: Color.fromARGB(255, 245, 20, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "HELP ME",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Hold To Alert",
                  style: TextStyle(
                    color: Color.fromARGB(179, 18, 2, 138),
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
} // FIXED: Added the missing closing bracket for the Class
