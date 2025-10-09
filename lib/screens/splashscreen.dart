import 'package:book_doctor_app/routes/app_routes.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to login after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, Routes.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo with circular background
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: const Color(0xFF800080), // Changed: FF for full opacity
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Image.asset(
                  'assets/images/Medinova.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 24),
            // App name
            const Text(
              'Book My Doctor',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF800080), // Changed: FF for full opacity
              ),
            ),
          ],
        ),
      ),
    );
  }
}
