import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SelectDateTimeScreen extends StatefulWidget {
  const SelectDateTimeScreen({Key? key}) : super(key: key);

  @override
  State<SelectDateTimeScreen> createState() => _SelectDateTimeScreenState();
}

class _SelectDateTimeScreenState extends State<SelectDateTimeScreen> {
  DateTime selectedDate = DateTime(2025, 9, 6);
  String selectedShift = 'Shift B : 1 PM - 3 PM';
  int selectedToken = 10;

  final List<String> shifts = [
    'Shift A : 11 AM - 12 PM',
    'Shift B : 1 PM - 3 PM',
    'Shift C : 4 PM - 6 PM',
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
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
            SizedBox(height: screenWidth * 0.01),
            _buildSelectedDateInfo(screenWidth),
            SizedBox(height: screenWidth * 0.04),
            _buildShiftSelector(screenWidth),
            SizedBox(height: screenWidth * 0.05),
            _buildTokenSelector(screenWidth),
            SizedBox(height: screenWidth * 0.06),
            _buildSetAppointmentButton(screenWidth),
            SizedBox(height: screenWidth * 0.06),
          ],
        ),
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
          SizedBox(height: screenWidth * 0.01),
          _buildWeekDaysHeader(),
          SizedBox(height: screenWidth * 0.01),
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
      child: Row(
        children: [
          Text(
            dateFormat.format(selectedDate),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 8),
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
                  vertical: 12,
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

  Widget _buildTokenSelector(double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.045),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Token',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: screenWidth * 0.04),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(10, (index) {
              final tokenNumber = index + 1;
              final isSelected = selectedToken == tokenNumber;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedToken = tokenNumber;
                  });
                },
                child: Container(
                  width: (screenWidth - (screenWidth * 0.09) - 50) / 5,
                  height: 50,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFF00C853)
                        : Colors.grey[600],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      tokenNumber.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildSetAppointmentButton(double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.045),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            // Handle appointment confirmation
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Appointment set for ${DateFormat('MMM d, yyyy').format(selectedDate)} - $selectedShift - Token $selectedToken',
                ),
                duration: const Duration(seconds: 3),
                backgroundColor: const Color(0xFF800080),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFF9800),
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: screenWidth * 0.045),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 0,
          ),
          child: const Text(
            'Set Appointment',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
