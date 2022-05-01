import 'package:flutter/material.dart';
import 'package:ghibli_api/ghibli_api.dart';

class FilmWidget extends StatelessWidget {
  const FilmWidget({
    required this.film,
    Key? key,
  }) : super(key: key);

  final Film film;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(film.title),
        subtitle: Text(
          film.description,
          maxLines: 3,
        ),
      ),
    );
  }
}
