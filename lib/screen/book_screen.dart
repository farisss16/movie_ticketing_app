// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:movie_ticket_app/widget/movie_poster.dart';

class BookScreen extends StatelessWidget {
  final String id;
  final String title;
  final String datetime;
  final String images;
  final String tag1;
  final String tag2;
  final String titleSynopsis;
  final String synopsis;
  final String name;
  BookScreen({
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: MoviePoster(
        images: images,
        size: size,
        title: title,
        datetime: datetime,
        tag1: tag1,
        tag2: tag2,
        titleSynopsis: titleSynopsis,
        synopsis: synopsis,
        id: id,
        name: name,
      ),
    );
  }
}
