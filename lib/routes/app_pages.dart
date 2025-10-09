import 'package:book_doctor_app/routes/app_routes.dart';
import 'package:book_doctor_app/screens/alldoctorsscreen.dart';
import 'package:book_doctor_app/screens/allhospitalscreen.dart';
import 'package:book_doctor_app/screens/appointmentscreen.dart';
import 'package:book_doctor_app/screens/homescreen.dart';
import 'package:book_doctor_app/screens/hospitaldetail.dart';
import 'package:book_doctor_app/screens/loginscreen.dart';
import 'package:book_doctor_app/screens/mytokensscreen.dart';
import 'package:book_doctor_app/screens/otpscreen.dart';
import 'package:book_doctor_app/screens/reviewscreen.dart';
import 'package:book_doctor_app/screens/splashscreen.dart';
import 'package:book_doctor_app/screens/tokenqueuescreen.dart';
import 'package:flutter/material.dart';

class AppPages {
  static Map<String, WidgetBuilder> routes = {
    // Remove this line: '/': (context) => const SplashScreen(),
    Routes.splash: (context) => const SplashScreen(),
    Routes.login: (context) => const LoginScreen(),
    Routes.verifyOtp: (context) => const OtpScreen(),
    Routes.home: (context) => const HomeScreen(),
    Routes.alldoctors: (context) => const AllDoctorsScreen(),
    Routes.allhospitals: (context) => const AllHospitalsScreen(),
    Routes.mytokens: (context) => const MyTokensScreen(),
    Routes.myreviews: (context) => ReviewsScreen(
      doctorName: 'Dr.Upul',
      doctorImage: 'assets/images/doctor1.png',
      rating: 5.0,
    ),
    Routes.appointments: (context) => AppointmentScreen(
      doctorName: 'Dr.Upul',
      doctorImage: 'assets/images/doctor1.png',
      specialization: 'Denteeth',
      payment: 120.00,
    ),
    Routes.tokenqueue: (context) =>
        const TokenQueueScreen(doctorName: "Dr. Pawan"),
    Routes.hospitaldetail: (context) => const HospitalDetailScreen(
      hospitalName: "MG Hospital",
      hospitalImage: 'assets/images/hospital1.png',
    ),
  };
}
