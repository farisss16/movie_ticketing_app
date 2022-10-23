// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:movie_ticket_app/dummy_data.dart';
import 'package:movie_ticket_app/widget/movie_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Movies',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xff7FB4C5),
                    minimumSize: Size(156, 50),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Now Showing',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xffC0C0BE),
                    minimumSize: Size(156, 50),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Coming Soon',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 0.9,
                ),
                itemCount: dummyMovies.length,
                itemBuilder: (context, index) {
                  final movies = dummyMovies[index];
                  final cinema = dummyCinema[index];
                  return MovieList(
                    id: movies.id,
                    title: movies.title,
                    datetime: movies.datetime,
                    images: movies.images,
                    tag1: movies.tag1,
                    tag2: movies.tag2,
                    titleSynopsis: movies.titleSynopsis,
                    synopsis: movies.synopsis,
                    name: cinema.name,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
