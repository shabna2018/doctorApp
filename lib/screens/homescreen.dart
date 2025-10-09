import 'package:book_doctor_app/routes/app_routes.dart';
import 'package:book_doctor_app/screens/hospitaldetail.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentCarouselIndex = 0;
  int _selectedTabIndex = 0;
  final PageController _carouselController = PageController();
  final List<bool> _doctorFavorites = [false, true];

  @override
  void dispose() {
    _carouselController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 360;
    final horizontalPadding = screenWidth * 0.045;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(horizontalPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(isSmallScreen),
                    SizedBox(height: screenWidth * 0.04),
                    _buildSearchBar(screenWidth, isSmallScreen),
                    SizedBox(height: screenWidth * 0.04),
                    _buildTabs(screenWidth, isSmallScreen),
                    SizedBox(height: screenWidth * 0.04),
                    _buildCarousel(screenWidth),
                    SizedBox(height: screenWidth * 0.04),
                    _buildListHeader(isSmallScreen),
                    SizedBox(height: screenWidth * 0.03),
                    // Conditionally render based on selected tab
                    if (_selectedTabIndex == 0) ...[
                      _buildDoctorCard(
                        name: 'Dr.Pawan',
                        image: 'assets/images/doctor1.png',
                        rating: 5.0,
                        isFavorite: _doctorFavorites[0],
                        index: 0,
                        screenWidth: screenWidth,
                        isSmallScreen: isSmallScreen,
                      ),
                      SizedBox(height: screenWidth * 0.03),
                      _buildDoctorCard(
                        name: 'Dr.Wanitha',
                        image: 'assets/images/doctor2.png',
                        rating: 5.0,
                        isFavorite: _doctorFavorites[1],
                        index: 1,
                        screenWidth: screenWidth,
                        isSmallScreen: isSmallScreen,
                      ),
                    ] else ...[
                      _buildHospitalCard(
                        name: 'MG Hospital',
                        image: 'assets/images/hospital1.png',
                        index: 0,
                        screenWidth: screenWidth,
                        isSmallScreen: isSmallScreen,
                      ),
                      SizedBox(height: screenWidth * 0.03),
                      _buildHospitalCard(
                        name: 'MG Hospital',
                        image: 'assets/images/hospital2.png',
                        index: 1,
                        screenWidth: screenWidth,
                        isSmallScreen: isSmallScreen,
                      ),
                    ],
                    // Add padding at bottom to prevent content from being hidden by floating button
                    SizedBox(height: screenWidth * 0.2),
                  ],
                ),
              ),
            ),
          ),
          // Floating button positioned over the screen
          Positioned(
            bottom: 20,
            right: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.mytokens);
              },
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
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(bool isSmallScreen) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              Container(
                width: isSmallScreen ? 40 : 45,
                height: isSmallScreen ? 40 : 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                    image: AssetImage('assets/images/profile.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, Welcome Back',
                      style: TextStyle(
                        fontSize: isSmallScreen ? 10 : 11,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'John Doe William',
                      style: TextStyle(
                        fontSize: isSmallScreen ? 13 : 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Stack(
          children: [
            Container(
              padding: EdgeInsets.all(isSmallScreen ? 6 : 8),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.notifications_outlined,
                color: Colors.black,
                size: isSmallScreen ? 20 : 22,
              ),
            ),
            Positioned(
              right: 6,
              top: 6,
              child: Container(
                width: 7,
                height: 7,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ],
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
              decoration: InputDecoration(
                hintText: _selectedTabIndex == 0
                    ? 'Search a Doctor'
                    : 'Search a hospitals',
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

  Widget _buildTabs(double screenWidth, bool isSmallScreen) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _selectedTabIndex = 0;
              });
            },
            child: Container(
              height: isSmallScreen ? 40 : 44,
              decoration: BoxDecoration(
                gradient: _selectedTabIndex == 0
                    ? const LinearGradient(
                        colors: [Color(0xFF800080), Color(0xFF800080)],
                      )
                    : null,
                color: _selectedTabIndex == 0 ? null : Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'Doctor',
                  style: TextStyle(
                    color: _selectedTabIndex == 0 ? Colors.white : Colors.black,
                    fontSize: isSmallScreen ? 13 : 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _selectedTabIndex = 1;
              });
            },
            child: Container(
              height: isSmallScreen ? 40 : 44,
              decoration: BoxDecoration(
                gradient: _selectedTabIndex == 1
                    ? const LinearGradient(
                        colors: [Color(0xFF800080), Color(0xFF800080)],
                      )
                    : null,
                color: _selectedTabIndex == 1 ? null : Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'Hospital',
                  style: TextStyle(
                    color: _selectedTabIndex == 1 ? Colors.white : Colors.black,
                    fontSize: isSmallScreen ? 13 : 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCarousel(double screenWidth) {
    final carouselHeight = screenWidth * 0.35;

    return Column(
      children: [
        SizedBox(
          height: carouselHeight,
          child: PageView(
            controller: _carouselController,
            onPageChanged: (index) {
              setState(() {
                _currentCarouselIndex = index;
              });
            },
            children: [
              _buildCarouselItem('assets/images/carosal.png', screenWidth),
              _buildCarouselItem('assets/images/carosal.png', screenWidth),
              _buildCarouselItem('assets/images/carosal.png', screenWidth),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
            (index) => GestureDetector(
              onTap: () {
                _carouselController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 3),
                width: 7,
                height: 7,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == _currentCarouselIndex
                      ? const Color(0xFF8E24AA)
                      : Colors.grey[300],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCarouselItem(String imagePath, double screenWidth) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildListHeader(bool isSmallScreen) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          _selectedTabIndex == 0 ? 'All Doctors' : 'All Hospitals',
          style: TextStyle(
            fontSize: isSmallScreen ? 16 : 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        GestureDetector(
          onTap: () {
            // Navigate based on selected tab
            if (_selectedTabIndex == 0) {
              Navigator.pushNamed(context, Routes.alldoctors);
            } else {
              // Navigate to All Hospitals screen
              Navigator.pushNamed(context, Routes.allhospitals);
            }
          },
          child: Text(
            'See All',
            style: TextStyle(
              fontSize: isSmallScreen ? 12 : 13,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF8E24AA),
            ),
          ),
        ),
      ],
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
    final cardPadding = screenWidth * 0.035;
    final imageSize = screenWidth * 0.18;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.myreviews);
      },
      child: Container(
        padding: EdgeInsets.all(cardPadding),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: imageSize,
              height: imageSize * 1.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: screenWidth * 0.035),
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
                          fontSize: isSmallScreen ? 14 : 16,
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
                              ? const Color(0xFF8E24AA)
                              : Colors.grey,
                          size: isSmallScreen ? 20 : 22,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenWidth * 0.015),
                  Text(
                    'lorem ipsum dolor, consectetur\nadipiscing elit. Viverra ut\nvelit interdum ac mattis.',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 10 : 11,
                      color: Colors.grey[600],
                      height: 1.3,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: screenWidth * 0.025),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.appointments);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.045,
                            vertical: isSmallScreen ? 6 : 7,
                          ),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF800080), Color(0xFF800080)],
                            ),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Text(
                            'Book',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: isSmallScreen ? 12 : 13,
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
                            size: isSmallScreen ? 16 : 18,
                          ),
                          const SizedBox(width: 3),
                          Text(
                            rating.toString(),
                            style: TextStyle(
                              fontSize: isSmallScreen ? 12 : 13,
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
      ),
    );
  }

  Widget _buildHospitalCard({
    required String name,
    required String image,
    required int index,
    required double screenWidth,
    required bool isSmallScreen,
  }) {
    final cardPadding = screenWidth * 0.035;

    return GestureDetector(
      onTap: () {
        // Navigate to Hospital Detail Screen when card is tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                HospitalDetailScreen(hospitalName: name, hospitalImage: image),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(cardPadding),
        decoration: BoxDecoration(
          color: Colors.white,
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
                      fontSize: isSmallScreen ? 16 : 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.02),
                  Text(
                    'Yorem ipsum dolor sit amet,\nconsectetur adipiscing elit. Nunc\nvulputate libero et velit interdum,\nac aliquet odio mattis.',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 10 : 11,
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
            Column(
              children: [
                Container(
                  width: screenWidth * 0.28,
                  height: screenWidth * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: screenWidth * 0.02),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
