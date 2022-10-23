// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

// ignore: unused_import

import 'package:flutter/material.dart';
import 'package:movie_ticket_app/screen/book_screen.dart';

class MovieList extends StatelessWidget {
  final String id;
  final String title;
  final String datetime;
  final String images;
  final String tag1;
  final String tag2;
  final String titleSynopsis;
  final String synopsis;
  final String name;

  MovieList({
    Key? key,
    required this.id,
    required this.title,
    required this.datetime,
    required this.images,
    required this.tag1,
    required this.tag2,
    required this.titleSynopsis,
    required this.synopsis,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.4),
            BlendMode.srcOver,
          ),
          fit: BoxFit.cover,
          image: AssetImage(images),
        ),
        // color: Colors.amber,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      height: 406,
      width: 325,
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              datetime,
              style: TextStyle(
                color: Colors.white,
                // fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 24,
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
                          SizedBox(
                            width: 88,
                          ),
                          ElevatedButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Color(0xff7FB4C5),
                              minimumSize: Size(78, 31),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return BookScreen(
                                      id: id,
                                      title: title,
                                      datetime: datetime,
                                      images: images,
                                      tag1: tag1,
                                      tag2: tag2,
                                      titleSynopsis: titleSynopsis,
                                      synopsis: synopsis,
                                      name: name,
                                    );
                                  },
                                ),
                              );
                            },
                            child: Text('Book'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 35,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
