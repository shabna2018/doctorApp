import 'package:book_doctor_app/routes/app_routes.dart';
import 'package:flutter/material.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF5F5F5), Color(0xFFFFFFFF)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Welcome text with background
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/images/Group 2.png',
                      width: 200,
                      height: 120,
                      fit: BoxFit.contain,
                    ),
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
                const SizedBox(height: 20),
                const Text(
                  'Select your role to continue',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 50),
                // Patient role card
                _RoleCard(
                  title: 'Patient',
                  subtitle: 'Book appointments with doctors',
                  icon: Icons.person_outline,
                  onTap: () {
                    Navigator.pushNamed(context, Routes.login);
                  },
                ),
                const SizedBox(height: 16),
                // Hospital role card
                _RoleCard(
                  title: 'Hospital',
                  subtitle: 'Manage hospital operations',
                  icon: Icons.local_hospital_outlined,
                  onTap: () {
                    Navigator.pushNamed(context, Routes.hospitalLogin);
                  },
                ),
                const SizedBox(height: 16),
                // Doctor role card
                _RoleCard(
                  title: 'Doctor',
                  subtitle: 'Access your appointments',
                  icon: Icons.medical_services_outlined,
                  onTap: () {
                    Navigator.pushNamed(context, Routes.doctorLogin);
                  },
                ),
                const SizedBox(height: 16),
                // Token Display role card
                _RoleCard(
                  title: 'Token Display',
                  subtitle: 'View queue and token numbers',
                  icon: Icons.tv_outlined,
                  onTap: () {
                    Navigator.pushNamed(context, Routes.tokenDisplayLogin);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RoleCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const _RoleCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFF800080).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: const Color(0xFF800080), size: 32),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[400]),
          ],
        ),
      ),
    );
  }
}
