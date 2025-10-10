import 'package:book_doctor_app/routes/app_routes.dart';
import 'package:flutter/material.dart';

class AllHospitalsScreen extends StatefulWidget {
  const AllHospitalsScreen({Key? key}) : super(key: key);

  @override
  State<AllHospitalsScreen> createState() => _AllHospitalsScreenState();
}

class _AllHospitalsScreenState extends State<AllHospitalsScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 360;
    final horizontalPadding = screenWidth * 0.045;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'All Hospitals',
          style: TextStyle(
            color: Color(0xFF800080),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(horizontalPadding),
                  child: _buildSearchBar(screenWidth, isSmallScreen),
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                    ),
                    children: [
                      _buildHospitalCard(
                        name: 'MG Hospital',
                        image: 'assets/images/hospital1.png',
                        description:
                            'Yorem ipsum dolor sit amet,\nconsectetur adipiscing elit. Nunc\nvulputate libero et velit interdum,\nac aliquet odio mattis.',
                        screenWidth: screenWidth,
                        isSmallScreen: isSmallScreen,
                      ),
                      SizedBox(height: screenWidth * 0.04),
                      _buildHospitalCard(
                        name: 'MG Hospital',
                        image: 'assets/images/hospital2.png',
                        description:
                            'Yorem ipsum dolor sit amet,\nconsectetur adipiscing elit. Nunc\nvulputate libero et velit interdum,\nac aliquet odio mattis.',
                        screenWidth: screenWidth,
                        isSmallScreen: isSmallScreen,
                      ),
                      SizedBox(height: screenWidth * 0.04),
                      _buildHospitalCard(
                        name: 'MG Hospital',
                        image: 'assets/images/hospital1.png',
                        description:
                            'Yorem ipsum dolor sit amet,\nconsectetur adipiscing elit. Nunc\nvulputate libero et velit interdum,\nac aliquet odio mattis.',
                        screenWidth: screenWidth,
                        isSmallScreen: isSmallScreen,
                      ),
                      SizedBox(height: screenWidth * 0.04),
                      _buildHospitalCard(
                        name: 'MG Hospital',
                        image: 'assets/images/hospital2.png',
                        description:
                            'Yorem ipsum dolor sit amet,\nconsectetur adipiscing elit. Nunc\nvulputate libero et velit interdum,\nac aliquet odio mattis.',
                        screenWidth: screenWidth,
                        isSmallScreen: isSmallScreen,
                      ),
                      SizedBox(height: screenWidth * 0.04),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Floating button positioned over the screen
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

  Widget _buildSearchBar(double screenWidth, bool isSmallScreen) {
    return Container(
      height: isSmallScreen ? 42 : 45,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: Colors.grey[600],
            size: isSmallScreen ? 20 : 22,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search a Hospitals',
                hintStyle: TextStyle(
                  color: Colors.grey[400],
                  fontSize: isSmallScreen ? 13 : 14,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
          Icon(
            Icons.mic_outlined,
            color: Colors.grey[600],
            size: isSmallScreen ? 20 : 22,
          ),
        ],
      ),
    );
  }

  // Replace your _buildHospitalCard method with this updated version

  Widget _buildHospitalCard({
    required String name,
    required String image,
    required String description,
    required double screenWidth,
    required bool isSmallScreen,
  }) {
    final cardPadding = screenWidth * 0.04;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.hospitaldetail);
      },
      child: Container(
        padding: EdgeInsets.all(cardPadding),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: isSmallScreen ? 18 : 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.02),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: isSmallScreen ? 11 : 12,
                      color: Colors.grey[600],
                      height: 1.4,
                    ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            SizedBox(width: screenWidth * 0.03),
            Container(
              width: screenWidth * 0.32,
              height: screenWidth * 0.28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
