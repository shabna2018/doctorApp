import 'package:book_doctor_app/routes/app_routes.dart';
import 'package:flutter/material.dart';

class AllDoctorsScreen extends StatefulWidget {
  const AllDoctorsScreen({Key? key}) : super(key: key);

  @override
  State<AllDoctorsScreen> createState() => _AllDoctorsScreenState();
}

class _AllDoctorsScreenState extends State<AllDoctorsScreen> {
  int _selectedSpecialtyIndex = 1; // Neurology selected by default
  final List<bool> _doctorFavorites = [false, true, false, false];

  final List<String> _specialties = [
    'Cardiology',
    'Neurology',
    'Cardiology',
    'Pediatrics',
    'Radiology',
  ];

  final List<Map<String, dynamic>> _doctors = [
    {'name': 'Dr.Pawan', 'image': 'assets/images/doctor1.png', 'rating': 5.0},
    {'name': 'Dr.Wanitha', 'image': 'assets/images/doctor2.png', 'rating': 5.0},
    {'name': 'Dr.Umesh', 'image': 'assets/images/doctor1.png', 'rating': 5.0},
    {'name': 'Dr.Pawan', 'image': 'assets/images/doctor2.png', 'rating': 5.0},
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
          'All Doctors',
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
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Column(
                  children: [
                    SizedBox(height: screenWidth * 0.04),
                    _buildSearchBar(screenWidth, isSmallScreen),
                    SizedBox(height: screenWidth * 0.04),
                    _buildSpecialtyTabs(screenWidth, isSmallScreen),
                    SizedBox(height: screenWidth * 0.04),
                  ],
                ),
              ),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  itemCount: _doctors.length,
                  separatorBuilder: (context, index) =>
                      SizedBox(height: screenWidth * 0.04),
                  itemBuilder: (context, index) {
                    final doctor = _doctors[index];
                    return _buildDoctorCard(
                      name: doctor['name'],
                      image: doctor['image'],
                      rating: doctor['rating'],
                      isFavorite: _doctorFavorites[index],
                      index: index,
                      screenWidth: screenWidth,
                      isSmallScreen: isSmallScreen,
                    );
                  },
                ),
              ),
            ],
          ),
          // Floating button positioned over the screen
          Positioned(
            right: 20,
            bottom: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.mytokens);
              },
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF800080), Color(0xFF800080)],
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF800080).withOpacity(0.4),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.person_add_outlined,
                  color: Colors.white,
                  size: 26,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(double screenWidth, bool isSmallScreen) {
    return Container(
      height: isSmallScreen ? 30 : 40,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: Colors.grey[600],
            size: isSmallScreen ? 22 : 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search a Doctor',
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
            color: Colors.grey[600],
            size: isSmallScreen ? 22 : 24,
          ),
        ],
      ),
    );
  }

  Widget _buildSpecialtyTabs(double screenWidth, bool isSmallScreen) {
    return SizedBox(
      height: isSmallScreen ? 38 : 42,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _specialties.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final isSelected = index == _selectedSpecialtyIndex;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedSpecialtyIndex = index;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.055,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                gradient: isSelected
                    ? const LinearGradient(
                        colors: [Color(0xFF800080), Color(0xFF800080)],
                      )
                    : null,
                color: isSelected ? null : Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isSelected ? Colors.transparent : Colors.grey[300]!,
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  _specialties[index],
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontSize: isSmallScreen ? 13 : 14,
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

  Widget _buildDoctorCard({
    required String name,
    required String image,
    required double rating,
    required bool isFavorite,
    required int index,
    required double screenWidth,
    required bool isSmallScreen,
  }) {
    final cardPadding = screenWidth * 0.04;
    final imageSize = screenWidth * 0.32;

    return Container(
      padding: EdgeInsets.all(cardPadding),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
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
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
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
                      name,
                      style: TextStyle(
                        fontSize: isSmallScreen ? 16 : 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _doctorFavorites[index] = !_doctorFavorites[index];
                        });
                      },
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite
                            ? const Color(0xFF800080)
                            : Colors.grey,
                        size: isSmallScreen ? 22 : 24,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenWidth * 0.02),
                Text(
                  'lorem ipsum dolor, consectetur\nadipiscing elit. Nunc v libero et\nvelit interdum, ac mattis.',
                  style: TextStyle(
                    fontSize: isSmallScreen ? 11 : 12,
                    color: Colors.grey[600],
                    height: 1.4,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: screenWidth * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.appointments);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.08,
                          vertical: isSmallScreen ? 8 : 9,
                        ),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF800080), Color(0xFF800080)],
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'Book',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: isSmallScreen ? 13 : 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
