import 'package:book_doctor_app/routes/app_routes.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 80),
                  // Welcome Text with background image
                  Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Background image
                        Image.asset(
                          'assets/images/Group 2.png',
                          width: 200,
                          height: 120,
                          fit: BoxFit.contain,
                        ),
                        // Welcome text on top
                        const Text(
                          'Welcome',
                          style: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF800080),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 60),
                  // Login Text
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Lorem ipsum text
                  const Text(
                    'Korem ipsum dolor sit amet, consectetur adipiscing elit.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Phone label
                  const Text(
                    'Phone',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Phone input field
                  Row(
                    children: [
                      // Country code container
                      Container(
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: const Center(
                          child: Text(
                            '+91',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Phone number field
                      Expanded(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: const TextField(
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: '984626789',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Generate OTP button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to OTP screen
                        Navigator.pushNamed(context, Routes.verifyOtp);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF800080),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Generate OTP',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Sign up text
                  Center(
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                        children: [
                          TextSpan(text: "Don't have an account? "),
                          TextSpan(
                            text: 'Sign Up',
                            style: TextStyle(
                              color: Color(0xFF800080),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
