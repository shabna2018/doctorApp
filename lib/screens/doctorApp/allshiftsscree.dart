import 'package:book_doctor_app/routes/app_routes.dart';
import 'package:flutter/material.dart';

class AllShiftsScreen extends StatefulWidget {
  const AllShiftsScreen({super.key});

  @override
  State<AllShiftsScreen> createState() => _AllShiftsScreenState();
}

class _AllShiftsScreenState extends State<AllShiftsScreen> {
  String _selectedTab = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'All Shifts',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF800080),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 40), // Balance the back button
                ],
              ),
            ),
            // Search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search a Doctor',
                    hintStyle: TextStyle(
                      color: Color(0xFF858585),
                      fontSize: 16,
                    ),
                    prefixIcon: Icon(Icons.search, color: Colors.grey.shade400),
                    suffixIcon: Icon(Icons.mic_none, color: Color(0xFF858585)),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Filter tabs
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  _buildFilterTab('All'),
                  const SizedBox(width: 12),
                  _buildFilterTab('Started'),
                  const SizedBox(width: 12),
                  _buildFilterTab('Finished'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Shifts list
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  _buildShiftCard(
                    date: '20-09-2025',
                    shift: 'Shift 1 (10AM-1PM)',
                    tokenFrom: '2',
                    tokenTo: '9',
                    backgroundColor: const Color(0xFFFFCDD2),
                  ),
                  const SizedBox(height: 12),
                  _buildShiftCard(
                    date: '20-09-2025',
                    shift: 'Shift 1 (10AM-1PM)',
                    tokenFrom: '2',
                    tokenTo: '9',
                    backgroundColor: const Color(0xFFC8E6C9),
                  ),
                  const SizedBox(height: 12),
                  _buildShiftCard(
                    date: '20-09-2025',
                    shift: 'Shift 1 (10AM-1PM)',
                    tokenFrom: '2',
                    tokenTo: '9',
                    backgroundColor: Color(0xFFF2F9F8),
                  ),
                  const SizedBox(height: 12),
                  _buildShiftCard(
                    date: '20-09-2025',
                    shift: 'Shift 1 (10AM-1PM)',
                    tokenFrom: '2',
                    tokenTo: '9',
                    backgroundColor: Color(0xFFF2F9F8),
                  ),
                  const SizedBox(height: 12),
                  _buildShiftCard(
                    date: '20-09-2025',
                    shift: 'Shift 1 (10AM-1PM)',
                    tokenFrom: '2',
                    tokenTo: '9',
                    backgroundColor: Color(0xFFF2F9F8),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterTab(String label) {
    final isSelected = _selectedTab == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF800080) : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildShiftCard({
    required String date,
    required String shift,
    required String tokenFrom,
    required String tokenTo,
    required Color backgroundColor,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.startconsult);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Date: $date',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Text(
                  shift,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Text(
                  'Token From :',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF800080),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    tokenFrom,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                const Text(
                  'Token To :',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF800080),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    tokenTo,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
