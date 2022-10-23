// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:movie_ticket_app/screen/cinema_screen.dart';

class MoviePoster extends StatelessWidget {
  MoviePoster({
    Key? key,
    required this.images,
    required this.size,
    required this.title,
    required this.datetime,
    required this.tag1,
    required this.tag2,
    required this.titleSynopsis,
    required this.synopsis,
    required this.id,
    required this.name,
  }) : super(key: key);

  final String images;
  final Size size;
  final String title;
  final String datetime;
  final String tag1;
  final String tag2;
  final String titleSynopsis;
  final String synopsis;
  final String id;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Poster(
          images: images,
          size: size,
          title: title,
          datetime: datetime,
          tag1: tag1,
          tag2: tag2,
        ),
        Synopsis(
          size: size,
          titleSynopsis: titleSynopsis,
          synopsis: synopsis,
        ),
        BookingButton(
          size: size,
          id: id,
          name: name,
        ),
      ],
    );
  }
}

class BookingButton extends StatelessWidget {
  const BookingButton({
    Key? key,
    required this.size,
    required this.id,
    required this.name,
  }) : super(key: key);

  final Size size;
  final String id;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.09,
      width: size.width,
      // color: Colors.amber,
      child: ElevatedButton(
        style: TextButton.styleFrom(
          backgroundColor: Color(0xff7FB4C5),
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return CinemaScreen(
                id: id,
                name: name,
              );
            },
          ));
        },
        child: Text('Book Now'),
      ),
    );
  }
}

class Synopsis extends StatelessWidget {
  const Synopsis({
    Key? key,
    required this.size,
    required this.titleSynopsis,
    required this.synopsis,
  }) : super(key: key);

  final Size size;
  final String titleSynopsis;
  final String synopsis;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.31,
      width: size.width,
      padding: EdgeInsets.only(
        top: 32,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 16,
              ),
              Text(
                titleSynopsis,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Text(
              synopsis,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Poster extends StatelessWidget {
  const Poster({
    Key? key,
    required this.images,
    required this.size,
    required this.title,
    required this.datetime,
    required this.tag1,
    required this.tag2,
  }) : super(key: key);

  final String images;
  final Size size;
  final String title;
  final String datetime;
  final String tag1;
  final String tag2;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.4),
            BlendMode.srcOver,
          ),
          fit: BoxFit.cover,
          image: AssetImage(images),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xffC0C0BE),
            spreadRadius: 10,
            blurRadius: 8,
          ),
        ],
      ),
      width: size.width,
      height: size.height * 0.6,
      child: Row(
        children: [
          SizedBox(
            width: 40,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                datetime,
                style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontSize: 10,
                  color: Color(0xff8F8F8F),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: Colors.white,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(2),
                      ),
                    ),
                    height: 23,
                    width: 68,
                    child: Center(
                      child: Text(
                        tag1,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: Colors.white,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(2),
                      ),
                    ),
                    height: 23,
                    width: 68,
                    child: Center(
                      child: Text(
                        tag2,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
