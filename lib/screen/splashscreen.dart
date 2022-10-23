// ignore_for_file: unused_field, unnecessary_new, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_ticket_app/screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isVisible = false;

  _SplashScreenState() {
    Timer(
      const Duration(milliseconds: 2000),
      () {
        setState(
          () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false);
          },
        );
      },
    );

    Timer(
      Duration(milliseconds: 10),
      () {
        setState(
          () {
            _isVisible =
                true; // Now it is showing fade effect and navigating to Login page
          },
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff7FB4C5),
      child: Center(
        child: Image.asset(
          'assets/images/logo_splashscreen.png',
          color: Color(0xff7FB4C5),
          colorBlendMode: BlendMode.modulate,
          scale: 1.7,
        ),
      ),
    );
  }
}
