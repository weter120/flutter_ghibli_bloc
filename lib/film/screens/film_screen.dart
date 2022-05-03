import 'package:flutter/material.dart';
import 'package:flutter_ghibli_bloc/film/widgets/film_screen_body.dart';
import 'package:ghibli_api/ghibli_api.dart';

class FilmScreen extends StatelessWidget {
  static route(Film film) => MaterialPageRoute(
      builder: (context) => FilmScreen(
            film: film,
          ));

  const FilmScreen({required this.film, Key? key}) : super(key: key);

  final Film film;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(film.title),
      ),
      body: SafeArea(
        child: FilmScreenBody(film: film),
      ),
    );
  }
}
