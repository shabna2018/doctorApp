import 'package:book_doctor_app/screens/reviewscreen.dart';
import 'package:flutter/material.dart';

class MyTokensScreen extends StatefulWidget {
  const MyTokensScreen({Key? key}) : super(key: key);

  @override
  State<MyTokensScreen> createState() => _MyTokensScreenState();
}

class _MyTokensScreenState extends State<MyTokensScreen> {
  int _selectedTabIndex = 0; // All selected by default

  final List<String> _tabs = ['All', 'Open', 'Visited', 'Closed'];

  final List<Map<String, dynamic>> _tokens = [
    {
      'doctorName': 'Dr .Pawan',
      'image': 'assets/images/doctor1.png',
      'patientId': '234567',
      'date': '20-09-2025',
      'shift': 'Shift 1 (10AM-1PM)',
      'tokenNo': '12',
      'rating': 5.0,
    },
    {
      'doctorName': 'Dr .Sunitha',
      'image': 'assets/images/doctor2.png',
      'patientId': '234567',
      'date': '20-09-2025',
      'shift': 'Shift 1 (10AM-1PM)',
      'tokenNo': '12',
      'rating': 5.0,
    },
    {
      'doctorName': 'Dr .Mustafa',
      'image': 'assets/images/doctor1.png',
      'patientId': '234567',
      'date': '20-09-2025',
      'shift': 'Shift 1 (10AM-1PM)',
      'tokenNo': '12',
      'rating': 5.0,
    },
    {
      'doctorName': 'Dr .Mustafa',
      'image': 'assets/images/doctor2.png',
      'patientId': '234567',
      'date': '20-09-2025',
      'shift': 'Shift 1 (10AM-1PM)',
      'tokenNo': '12',
      'rating': 5.0,
    },
  ];

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
          'My Tokens',
          style: TextStyle(
            color: Color(0xFF800080),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(
              children: [
                SizedBox(height: screenWidth * 0.04),
                _buildSearchBar(screenWidth, isSmallScreen),
                SizedBox(height: screenWidth * 0.04),
                _buildTabs(screenWidth, isSmallScreen),
                SizedBox(height: screenWidth * 0.04),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              itemCount: _tokens.length,
              separatorBuilder: (context, index) =>
                  SizedBox(height: screenWidth * 0.04),
              itemBuilder: (context, index) {
                final token = _tokens[index];
                return _buildTokenCard(
                  doctorName: token['doctorName'],
                  image: token['image'],
                  patientId: token['patientId'],
                  date: token['date'],
                  shift: token['shift'],
                  tokenNo: token['tokenNo'],
                  rating: token['rating'],
                  screenWidth: screenWidth,
                  isSmallScreen: isSmallScreen,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(double screenWidth, bool isSmallScreen) {
    return Container(
      height: isSmallScreen ? 48 : 52,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: Colors.grey[400],
            size: isSmallScreen ? 22 : 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search a hospitals',
                hintStyle: TextStyle(
                  color: Colors.grey[400],
                  fontSize: isSmallScreen ? 14 : 15,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
          Icon(
            Icons.mic_outlined,
            color: Colors.grey[400],
            size: isSmallScreen ? 22 : 24,
          ),
        ],
      ),
    );
  }

  Widget _buildTabs(double screenWidth, bool isSmallScreen) {
    return SizedBox(
      height: isSmallScreen ? 48 : 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _tabs.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final isSelected = index == _selectedTabIndex;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedTabIndex = index;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.08,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                gradient: isSelected
                    ? const LinearGradient(
                        colors: [Color(0xFF800080), Color(0xFF800080)],
                      )
                    : null,
                color: isSelected ? null : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected ? Colors.transparent : Colors.grey[300]!,
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  _tabs[index],
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontSize: isSmallScreen ? 14 : 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTokenCard({
    required String doctorName,
    required String image,
    required String patientId,
    required String date,
    required String shift,
    required String tokenNo,
    required double rating,
    required double screenWidth,
    required bool isSmallScreen,
  }) {
    final cardPadding = screenWidth * 0.04;
    final imageSize = screenWidth * 0.32;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReviewsScreen(
              doctorName: doctorName,
              doctorImage: image,
              rating: rating,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(cardPadding),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F0F5),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: imageSize,
              height: imageSize * 1.35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                image: DecorationImage(image: AssetImage(image)),
              ),
            ),
            SizedBox(width: screenWidth * 0.04),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        doctorName,
                        style: TextStyle(
                          fontSize: isSmallScreen ? 16 : 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Icon(
                        Icons.chat_bubble_outline,
                        color: Colors.grey[600],
                        size: isSmallScreen ? 22 : 24,
                      ),
                    ],
                  ),
                  SizedBox(height: screenWidth * 0.015),
                  Text(
                    'Patient ID : $patientId',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 12 : 13,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.015),
                  Text(
                    'Date: $date',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 12 : 13,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.02),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF800080), Color(0xFF800080)],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      shift,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isSmallScreen ? 11 : 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.02),
                  Row(
                    children: [
                      Text(
                        'Token No : $tokenNo',
                        style: TextStyle(
                          fontSize: isSmallScreen ? 12 : 13,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: isSmallScreen ? 18 : 20,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        rating.toString(),
                        style: TextStyle(
                          fontSize: isSmallScreen ? 13 : 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
