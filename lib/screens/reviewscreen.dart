import 'package:book_doctor_app/routes/app_routes.dart';
import 'package:book_doctor_app/screens/showaddreview.dart';
import 'package:flutter/material.dart';

class ReviewsScreen extends StatelessWidget {
  final String doctorName;
  final String doctorImage;
  final double rating;

  const ReviewsScreen({
    super.key,
    required this.doctorName,
    required this.doctorImage,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

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
          'Reviews',
          style: TextStyle(
            color: Color(0xFF800080),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.045),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenWidth * 0.01),
              _buildDoctorHeader(screenWidth, context),
              SizedBox(height: screenWidth * 0.05),
              _buildStatsCards(screenWidth),
              SizedBox(height: screenWidth * 0.05),
              _buildLastReviewsHeader(screenWidth, context),
              SizedBox(height: screenWidth * 0.04),
              _buildReviewsList(screenWidth),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDoctorHeader(double screenWidth, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.tokenqueue);
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.all(screenWidth * 0.04),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: screenWidth * 0.25,
              height: screenWidth * 0.32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[100],
                image: DecorationImage(
                  image: AssetImage(doctorImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: screenWidth * 0.04),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctorName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Radiology',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF800080),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'Welcare Hospital',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      ...List.generate(5, (index) {
                        return Icon(
                          Icons.star,
                          size: 16,
                          color: index < rating.floor()
                              ? Colors.orange
                              : Colors.grey[300],
                        );
                      }),
                      const SizedBox(width: 6),
                      Text(
                        '$rating',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        '45 Reviews',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Text(
                        'Payment',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Text(
                        '\$120.00',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF800080),
                          fontWeight: FontWeight.bold,
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

  Widget _buildStatsCards(double screenWidth) {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            icon: Icons.groups_outlined,
            label: 'Visits',
            value: '1.2k',
            screenWidth: screenWidth,
          ),
        ),
        SizedBox(width: screenWidth * 0.03),
        Expanded(
          child: _buildStatCard(
            icon: Icons.groups_outlined,
            label: 'Patients',
            value: '1.2k',
            screenWidth: screenWidth,
          ),
        ),
        SizedBox(width: screenWidth * 0.03),
        Expanded(
          child: _buildStatCard(
            icon: Icons.work_outline,
            label: 'Exp',
            value: '4 Years',
            screenWidth: screenWidth,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String label,
    required String value,
    required double screenWidth,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: screenWidth * 0.04,
        horizontal: screenWidth * 0.03,
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF800080), Color(0xFF800080)],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: 20),
              const SizedBox(width: 6),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLastReviewsHeader(double screenWidth, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Last Reviews',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            showAddReviewDialog(context); // Call the dialog here
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF246BFD),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 0,
          ),
          child: const Text(
            'Add Review',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }

  Widget _buildReviewsList(double screenWidth) {
    final reviews = [
      {
        'name': 'Johny Mohan',
        'rating': 4.4,
        'date': '12-02-2025',
        'image': 'assets/images/profile.png',
      },
      {
        'name': 'Maria Philip',
        'rating': 4.4,
        'date': '12-02-2025',
        'image': 'assets/images/profile.png',
      },
      {
        'name': 'Varma',
        'rating': 4.4,
        'date': '12-02-2025',
        'image': 'assets/images/profile.png',
      },
    ];

    return Column(
      children: reviews.map((review) {
        return Padding(
          padding: EdgeInsets.only(bottom: screenWidth * 0.04),
          child: _buildReviewCard(
            name: review['name'] as String,
            rating: review['rating'] as double,
            date: review['date'] as String,
            image: review['image'] as String,
            screenWidth: screenWidth,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildReviewCard({
    required String name,
    required double rating,
    required String date,
    required String image,
    required double screenWidth,
  }) {
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage(image),
                backgroundColor: Colors.grey[200],
              ),
              SizedBox(width: screenWidth * 0.03),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        ...List.generate(5, (index) {
                          return Icon(
                            Icons.star,
                            size: 14,
                            color: index < rating.floor()
                                ? Colors.orange
                                : Colors.grey[300],
                          );
                        }),
                        const SizedBox(width: 6),
                        Text(
                          rating.toString(),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                date,
                style: TextStyle(fontSize: 12, color: Colors.grey[500]),
              ),
            ],
          ),
          SizedBox(height: screenWidth * 0.03),
          Text(
            'Yorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Yorem ipsum dolor sit amet, consectetur adipiscing elit.',
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[600],
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
