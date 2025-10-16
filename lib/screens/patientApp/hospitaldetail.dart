import 'package:flutter/material.dart';

class HospitalDetailScreen extends StatelessWidget {
  final String hospitalName;
  final String hospitalImage;
  final String address;
  final String email;
  final String phone;

  const HospitalDetailScreen({
    super.key,
    required this.hospitalName,
    required this.hospitalImage,
    this.address =
        'Welcare Hospital, Sahodaran Ayyappan Road, Vyttila, Ernakulam, Kerala 682019',
    this.email = 'Welcare@health.in',
    this.phone = '+91 98467 56789',
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth * 0.05;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Overview',
          style: TextStyle(
            color: Color(0xFF800080),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hospital Image
                Container(
                  width: double.infinity,
                  height: screenWidth * 0.45,
                  margin: EdgeInsets.all(horizontalPadding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(hospitalImage, fit: BoxFit.fitHeight),
                  ),
                ),

                // Hospital Details Card
                Container(
                  margin: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  padding: EdgeInsets.all(horizontalPadding),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Hospital Name
                      Text(
                        hospitalName,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Address
                      _buildInfoRow(
                        icon: Icons.location_on,
                        iconColor: const Color(0xFF800080),
                        text: address,
                      ),
                      const SizedBox(height: 12),

                      // Email
                      _buildInfoRow(
                        icon: Icons.email,
                        iconColor: const Color(0xFF800080),
                        text: email,
                      ),
                      const SizedBox(height: 12),

                      // Phone
                      _buildInfoRow(
                        icon: Icons.phone,
                        iconColor: const Color(0xFF800080),
                        text: phone,
                      ),
                      const SizedBox(height: 12),

                      // Get Directions
                      _buildInfoRow(
                        icon: Icons.directions,
                        iconColor: const Color(0xFF800080),
                        text: 'Get Directions',
                      ),
                      const SizedBox(height: 20),

                      // Description
                      Text(
                        'Worem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis. Ut commodo efficitur neque. Curabitur tempus urna at turpis condimentum lobortis. Ut commodo efficitur neque.',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[600],
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 80),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Floating Action Button
          Positioned(
            bottom: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF800080), Color(0xFF800080)],
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF800080).withOpacity(0.4),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(
                Icons.person_add_outlined,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required Color iconColor,
    required String text,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: iconColor, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[600],
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}
