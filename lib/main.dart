import 'package:flutter/material.dart';
import 'package:gyym/Responsive/responsive.dart';

import 'Responsive/mobile_screen.dart';
import 'Responsive/web_screen.dart';
import 'Screens/login_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GYYM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black87,
      ),
      // home: const ResponsiveScreen(
      //   webScreen: WebScreen(),
      //   mobScreen: MobileScreen(),
      // ),

      home: const LoginScreen(),
    );
  }
}
