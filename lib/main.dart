import 'package:flutter/material.dart';
import 'package:krucetfeetracker/ui/pages/adminhome_page.dart';
import 'package:krucetfeetracker/ui/pages/feedetails_page.dart';
import 'package:krucetfeetracker/ui/pages/login_page.dart';
import 'package:krucetfeetracker/ui/pages/signup_page.dart';
import 'package:krucetfeetracker/ui/pages/studentdetails_page.dart';
import 'package:krucetfeetracker/ui/pages/verifyemail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, routes: {
      '/': (context) => LoginPage(),
      '/signup': (context) => SignupPage(),
      '/feedetails': ((context) => FeeDetails()),
      '/verifyemail': ((context) => VerifyEmail()),
      '/studentdetails': ((context) => StudentDetails()),
      '/adminhome': ((context) => const AdminHome()),
    });
  }
}
