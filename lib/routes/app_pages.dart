import 'package:book_doctor_app/routes/app_routes.dart';
import 'package:book_doctor_app/screens/doctorApp/allshiftsscree.dart';
import 'package:book_doctor_app/screens/doctorApp/doctorlogin.dart';
import 'package:book_doctor_app/screens/doctorApp/startconsultationscreen.dart';
import 'package:book_doctor_app/screens/hospitalApp/aboutdoctorscreen.dart';
import 'package:book_doctor_app/screens/hospitalApp/hospitalHomescreen.dart';
import 'package:book_doctor_app/screens/hospitalApp/hospitallogin.dart';
import 'package:book_doctor_app/screens/hospitalApp/scheduleconsultscreen.dart';
import 'package:book_doctor_app/screens/patientApp/alldoctorsscreen.dart';
import 'package:book_doctor_app/screens/patientApp/allhospitalscreen.dart';
import 'package:book_doctor_app/screens/patientApp/appointmentscreen.dart';
import 'package:book_doctor_app/screens/patientApp/homescreen.dart';
import 'package:book_doctor_app/screens/patientApp/hospitaldetail.dart';
import 'package:book_doctor_app/screens/patientApp/loginscreen.dart';
import 'package:book_doctor_app/screens/patientApp/mytokensscreen.dart';
import 'package:book_doctor_app/screens/patientApp/otpscreen.dart';
import 'package:book_doctor_app/screens/patientApp/reviewscreen.dart';
import 'package:book_doctor_app/common/roleselectionacreen.dart';
import 'package:book_doctor_app/screens/patientApp/selectdatetimescreen.dart';
import 'package:book_doctor_app/screens/patientApp/splashscreen.dart';
import 'package:book_doctor_app/screens/patientApp/tokenqueuescreen.dart';
import 'package:flutter/material.dart';

class AppPages {
  static Map<String, WidgetBuilder> routes = {
    Routes.splash: (context) => const SplashScreen(),
    Routes.roleSelection: (context) => const RoleSelectionScreen(), // Add this
    Routes.login: (context) => const LoginScreen(), // Patient login
    Routes.hospitalLogin: (context) => const HospitalLoginScreen(),
    Routes.hospitalhome: (context) => const HospitalHomeScreen(),
    Routes.aboutdoctor: (context) => const DoctorAboutScreen(),
    Routes.doctorLogin: (context) => const DoctorLoginScreen(),
    Routes.allshifts: (context) => const AllShiftsScreen(),
    Routes.startconsult: (context) => const StartConsultationScreen(),
    // Routes.doctorLogin: (context) => const DoctorLoginScreen(), // Add this
    // Routes.tokenDisplayLogin: (context) => const TokenDisplayLoginScreen(), // Add this
    Routes.verifyOtp: (context) => const OtpScreen(),
    Routes.home: (context) => const HomeScreen(),
    Routes.alldoctors: (context) => const AllDoctorsScreen(),
    Routes.allhospitals: (context) => const AllHospitalsScreen(),
    Routes.mytokens: (context) => const MyTokensScreen(),
    Routes.selectdateandtime: (context) => const SelectDateTimeScreen(),
    Routes.scheduleconsult: (context) => const SelectDateTimeTokenScreen(),
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
