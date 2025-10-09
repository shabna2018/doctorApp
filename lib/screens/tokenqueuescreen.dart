import 'package:flutter/material.dart';

class TokenQueueScreen extends StatefulWidget {
  final String doctorName;

  const TokenQueueScreen({super.key, required this.doctorName});

  @override
  State<TokenQueueScreen> createState() => _TokenQueueScreenState();
}

class _TokenQueueScreenState extends State<TokenQueueScreen> {
  bool isCurrentToken = true;

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
        title: Text(
          widget.doctorName,
          style: const TextStyle(
            color: Color(0xFF800080),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark_border, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.045),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: _buildCurrentTokenCard(screenWidth)),
                  SizedBox(width: screenWidth * 0.03),
                  Expanded(child: _buildMyTokenCard(screenWidth)),
                ],
              ),
              _buildTokenGrid(screenWidth),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentTokenCard(double screenWidth) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xFFF2F9F8),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF800080), Color(0xFF600060)],
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Center(
              child: Text(
                'Current Token',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          const Text(
            '8',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              height: 1,
            ),
          ),
          SizedBox(height: screenWidth * 0.04),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.calendar_today_outlined,
                size: 16,
                color: Colors.grey.shade600,
              ),
              const SizedBox(width: 6),
              Text(
                '23-09-2025',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            '12:45 PM',
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMyTokenCard(double screenWidth) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xFFF2F9F8),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF800080), Color(0xFF600060)],
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Center(
              child: Text(
                'My Token',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(height: screenWidth * 0.06),
          Text(
            'Token N.o',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade800,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: screenWidth * 0.04),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
            decoration: BoxDecoration(
              color: const Color(0xFF00A651),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              '12',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTokenGrid(double screenWidth) {
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.045),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: _buildTokenNumbersGrid(screenWidth),
    );
  }

  Widget _buildTokenNumbersGrid(double screenWidth) {
    final Map<int, String> tokenStatus = {
      1: 'booked',
      2: 'booked',
      3: 'booked',
      4: 'booked',
      5: 'booked',
      6: 'booked',
      7: 'booked',
      8: 'completed',
      9: 'completed',
      10: 'completed',
      11: 'completed',
      12: 'completed',
      13: 'completed',
      24: 'completed',
      27: 'completed',
      28: 'completed',
      36: 'completed',
      37: 'completed',
    };

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.15,
      ),
      itemCount: 44,
      itemBuilder: (context, index) {
        final tokenNumber = index + 1;
        final status = tokenStatus[tokenNumber] ?? 'available';

        Color backgroundColor;
        Color textColor;

        switch (status) {
          case 'booked':
            backgroundColor = const Color(0xFFFF0000);
            textColor = Colors.white;
            break;
          case 'completed':
            backgroundColor = const Color(0xFF00A651);
            textColor = Colors.white;
            break;
          default:
            backgroundColor = Colors.grey.shade300;
            textColor = Colors.black87;
        }

        return Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              tokenNumber.toString(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
