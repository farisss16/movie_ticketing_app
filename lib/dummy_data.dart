import 'package:movie_ticket_app/models/cinema.dart';

import 'models/movies.dart';

List<Movies> dummyMovies = [
  Movies(
      id: 'id_onepiece',
      title: 'One Piece Film RED',
      datetime: '1h 55mins \t \t \t 29 Sept',
      images: 'assets/images/movie1.png',
      tag1: 'Fantasi',
      tag2: 'Petualangan',
      titleSynopsis: 'Synopsis',
      synopsis:
          'Untuk pertama kalinya, Uta - penyanyi yang paling dicintai akan mengungkapkan dirinya kepada dunia di konser langsungnya. Suara yang ditunggu-tunggu oleh seluruh dunia akan segera bergema.'),
  Movies(
    id: 'id_miracleincell',
    title: 'Miracle In Cell NO 7',
    datetime: '2h 25mins \t \t \t 29 Sept',
    images: 'assets/images/movie2.png',
    tag1: 'Family',
    tag2: 'Drama',
    titleSynopsis: 'Synopsis',
    synopsis:
        'Dodo Rozak hanya ingin menjadi ayah yang baik bagi putrinya, Kartika, meski kecerdasannya terbatas, bersikap dan bertingkah laku seperti anak-anak. Padahal, Kartika-lah yang paling sering merawat ayahnya. Keduanya hidup bahagia.',
  ),
];

List<Cinema> dummyCinema = [
  Cinema(
    id: 'Cinema 1',
    name: 'AEON MALL JGC CGV',
  ),
  Cinema(
    id: 'Cinema 2',
    name: 'ARION XXI',
  ),
  Cinema(
    id: 'Cinema 3',
    name: 'ARTHA GADING XXI',
  ),
  Cinema(
    id: 'Cinema 4',
    name: 'ATRIUM XXI',
  ),
  Cinema(
    id: 'Cinema 5',
    name: 'BASSURA XXI',
  ),
  Cinema(
    id: 'Cinema 6',
    name: 'BAYWALK PLUIT PREMIERE',
  ),
  Cinema(
    id: 'Cinema 7',
    name: 'BLOK M SQUARE',
  ),
  Cinema(
    id: 'Cinema 8',
    name: 'BLOK M XXI',
  ),
  Cinema(
    id: 'Cinema 9',
    name: 'BUARAN PLAZA CGV',
  ),
  Cinema(
    id: 'Cinema 10',
    name: 'CIJANTUNG XXI',
  ),
  Cinema(
    id: 'Cinema 11',
    name: 'CENTRAL PARK CGV',
  ),
  Cinema(
    id: 'Cinema 1',
    name: 'CIPINANG XXI',
  ),
  Cinema(
    id: 'Cinema 12',
    name: 'DAAN MOGOT XXI',
  ),
  Cinema(
    id: 'Cinema 13',
    name: 'DJAKARTA XXI',
  ),
  Cinema(
    id: 'Cinema 14',
    name: 'EPICENTRUM XXI',
  ),
  Cinema(
    id: 'Cinema 15',
    name: 'FX SUDIRMAN CGV',
  ),
];
