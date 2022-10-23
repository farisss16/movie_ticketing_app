// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_ticket_app/screen/home_screen.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xff7FB4C5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Color(0xff7FB4C5),
              child: LottieBuilder.asset('assets/images/successnotif.json'),
            ),
            Text(
              'Booking Success',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              style: TextButton.styleFrom(
                  backgroundColor: Color(0xff7FB4C5),
                  minimumSize: Size(200, 45)),
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => HomePage()),
                    (route) => false);
              },
              child: Text('Back Home'),
            ),
          ],
        ),
      ),
    );
  }
}
