import 'package:book_doctor_app/screens/selectdatetimescreen.dart';
import 'package:flutter/material.dart';

class AppointmentScreen extends StatefulWidget {
  final String doctorName;
  final String doctorImage;
  final String specialization;
  final double payment;

  const AppointmentScreen({
    Key? key,
    required this.doctorName,
    required this.doctorImage,
    required this.specialization,
    required this.payment,
  }) : super(key: key);

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  String selectedTime = '11.00 AM';
  String selectedDate = 'Tue 6';

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
          'Appointment',
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
              SizedBox(height: screenWidth * 0.04),
              _buildDoctorCard(screenWidth),
              SizedBox(height: screenWidth * 0.05),
              _buildDetailsSection(screenWidth),
              SizedBox(height: screenWidth * 0.05),
              _buildWorkingHoursSection(screenWidth),
              SizedBox(height: screenWidth * 0.05),
              _buildDateSection(screenWidth),
              SizedBox(height: screenWidth * 0.06),
              _buildBookButton(screenWidth),
              SizedBox(height: screenWidth * 0.06),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDoctorCard(double screenWidth) {
    return Container(
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
            width: screenWidth * 0.22,
            height: screenWidth * 0.26,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey[100],
              image: DecorationImage(
                image: AssetImage(widget.doctorImage),
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
                  children: [
                    Expanded(
                      child: Text(
                        widget.doctorName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.message_outlined,
                            size: 18,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.phone_outlined,
                            size: 18,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.videocam_outlined,
                            size: 18,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  widget.specialization,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF800080),
                    fontWeight: FontWeight.w500,
                  ),
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
                    Text(
                      '\$${widget.payment.toStringAsFixed(2)}',
                      style: const TextStyle(
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
    );
  }

  Widget _buildDetailsSection(double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Details',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: screenWidth * 0.03),
        Text(
          'Worem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis. Ut commodo efficitur neque. Ut diam quam, semper iaculis condimentum ac, vestibulum eu nisl.',
          style: TextStyle(fontSize: 13, color: Colors.grey[600], height: 1.5),
        ),
      ],
    );
  }

  Widget _buildWorkingHoursSection(double screenWidth) {
    final times = ['10.00 AM', '11.00 AM', '12.00 PM'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Working Hours',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SelectDateTimeScreen(),
                  ),
                );
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: const Size(50, 30),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text(
                'See All',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: screenWidth * 0.03),
        Row(
          children: times.map((time) {
            final isSelected = selectedTime == time;
            return Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  right: time != times.last ? screenWidth * 0.03 : 0,
                ),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTime = time;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: screenWidth * 0.04),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFF800080)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected
                            ? const Color(0xFF800080)
                            : Colors.grey[300]!,
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        time,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildDateSection(double screenWidth) {
    final dates = ['Tue 6', 'Wed 7', 'Thu 8'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Date',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: const Size(50, 30),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text(
                'See All',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: screenWidth * 0.03),
        Row(
          children: dates.map((date) {
            final isSelected = selectedDate == date;
            return Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  right: date != dates.last ? screenWidth * 0.03 : 0,
                ),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDate = date;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: screenWidth * 0.04),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFF800080)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected
                            ? const Color(0xFF800080)
                            : Colors.grey[300]!,
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        date,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildBookButton(double screenWidth) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Handle booking
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF246BFD),
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: screenWidth * 0.045),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        child: const Text(
          'Book an Appointment',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
