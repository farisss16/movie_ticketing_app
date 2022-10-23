// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:movie_ticket_app/dummy_data.dart';
import 'package:movie_ticket_app/screen/seat_screen.dart';

class CinemaScreen extends StatelessWidget {
  final String id;
  final String name;
  CinemaScreen({
    Key? key,
    required this.id,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xff999999),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'CINEMA',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: dummyCinema.length,
          itemBuilder: (context, index) {
            final cinema = dummyCinema[index];
            return Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SeatScreen();
                      },
                    ),
                  );
                },
                title: Text(cinema.name),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
            );
          },
        ),
      ),
    );
  }
}
