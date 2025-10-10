import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SelectDateTimeTokenScreen extends StatefulWidget {
  const SelectDateTimeTokenScreen({super.key});

  @override
  State<SelectDateTimeTokenScreen> createState() =>
      _SelectDateTimeTokenScreenState();
}

class _SelectDateTimeTokenScreenState extends State<SelectDateTimeTokenScreen> {
  DateTime selectedDate = DateTime(2025, 9, 6);
  String selectedShift = 'Shift 2 : 2 PM - 3 PM';
  int tokenFrom = 2;
  int tokenTo = 12;

  final List<String> shifts = [
    'Shift 1 : 11 AM - 12 PM',
    'Shift 2 : 2 PM - 3 PM',
    'Shift 3 : 4 PM - 6 PM',
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Select Date And Time',
          style: TextStyle(
            color: Color(0xFF800080),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCalendar(screenWidth),
            SizedBox(height: screenWidth * 0.02),
            _buildSelectedDateInfo(screenWidth),
            SizedBox(height: screenWidth * 0.04),
            _buildShiftSelector(screenWidth),
            SizedBox(height: screenWidth * 0.05),
            _buildTokenRangeSelector(screenWidth),
            SizedBox(height: screenWidth * 0.06),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle add action
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Date: ${DateFormat('MMM d, yyyy').format(selectedDate)}\n$selectedShift\nTokens: $tokenFrom - $tokenTo',
              ),
              duration: const Duration(seconds: 2),
              backgroundColor: const Color(0xFF800080),
            ),
          );
        },
        backgroundColor: const Color(0xFF800080),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildCalendar(double screenWidth) {
    return Container(
      margin: EdgeInsets.all(screenWidth * 0.045),
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildCalendarHeader(screenWidth),
          SizedBox(height: screenWidth * 0.03),
          _buildWeekDaysHeader(),
          SizedBox(height: screenWidth * 0.02),
          _buildCalendarDays(screenWidth),
        ],
      ),
    );
  }

  Widget _buildCalendarHeader(double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Sep',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const Text(
          '2025',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF800080),
          ),
        ),
      ],
    );
  }

  Widget _buildWeekDaysHeader() {
    final weekDays = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: weekDays.map((day) {
        return Expanded(
          child: Center(
            child: Text(
              day,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCalendarDays(double screenWidth) {
    // September 2025 calendar data
    final daysInMonth = [
      [29, 30, 31, 1, 2, 3, 4],
      [5, 6, 7, 8, 9, 10, 11],
      [12, 13, 14, 15, 16, 17, 18],
      [19, 20, 21, 22, 23, 24, 25],
      [26, 27, 28, 29, 30, 1, 2],
    ];

    final prevMonthDays = [29, 30, 31];
    final nextMonthDays = [1, 2];

    return Column(
      children: daysInMonth.asMap().entries.map((entry) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: entry.value.map((day) {
              final isSelected = day == 6 && entry.key == 1;
              final isToday = day == 4 && entry.key == 0;
              final isPrevMonth = entry.key == 0 && prevMonthDays.contains(day);
              final isNextMonth = entry.key == 4 && nextMonthDays.contains(day);
              final isOtherMonth = isPrevMonth || isNextMonth;

              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (!isOtherMonth) {
                      setState(() {
                        selectedDate = DateTime(2025, 9, day);
                      });
                    }
                  },
                  child: Container(
                    height: 40,
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFF800080)
                          : isToday
                          ? const Color(0xFF800080)
                          : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        day.toString(),
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: isSelected || isToday
                              ? Colors.white
                              : isOtherMonth
                              ? Colors.grey[400]
                              : Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSelectedDateInfo(double screenWidth) {
    final dateFormat = DateFormat('MMM d, yyyy');
    final dayFormat = DateFormat('EEEE');

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.045),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dateFormat.format(selectedDate),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            dayFormat.format(selectedDate),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShiftSelector(double screenWidth) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.045),
        itemCount: shifts.length,
        itemBuilder: (context, index) {
          final shift = shifts[index];
          final isSelected = selectedShift == shift;

          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedShift = shift;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFF800080) : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: isSelected
                        ? const Color(0xFF800080)
                        : Colors.grey[300]!,
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    shift,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? Colors.white : Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTokenRangeSelector(double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          // Token From
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Token From',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFF800080),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        tokenFrom.toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          // Token To
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Token To',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFF800080),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        tokenTo.toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
