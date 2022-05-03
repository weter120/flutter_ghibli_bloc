import 'package:flutter/material.dart';
import 'package:flutter_ghibli_bloc/utils/constrains.dart';
import 'package:flutter_ghibli_bloc/utils/strings.dart';
import 'package:ghibli_api/ghibli_api.dart';

class FilmScreenBody extends StatelessWidget {
  static const _maxWidth = 400.0;

  const FilmScreenBody({required this.film, Key? key}) : super(key: key);

  final Film film;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    final widgets = [
      AspectRatio(
        aspectRatio: 2 / 3,
        child: Image.network(film.image),
      ),
      Text(
        film.originalTitle,
        textAlign: TextAlign.center,
        style: theme.headline3,
      ),
      Text(
        film.originalTitleRomanised,
        textAlign: TextAlign.center,
        style: theme.headline5,
      ),
      Text(
        AppStrings.releaseDate + film.releaseDate,
        style: theme.subtitle2,
      ),
      Text(
        AppStrings.rtScore + film.rtScore,
        style: theme.bodyText1,
      ),
      Text(
        AppStrings.director + film.director,
        style: theme.subtitle2,
      ),
      Text(
        AppStrings.producer + film.producer,
        style: theme.subtitle2,
      ),
      Text(
        AppStrings.description + film.description,
        style: theme.bodyText1,
      ),
      const SizedBox(
        height: 20,
      ),
    ];

    return ListView(
      children: widgets
          .map(
            (widget) => Align(
              child: Container(
                constraints: const BoxConstraints(maxWidth: _maxWidth),
                padding: const EdgeInsets.all(AppPadding.small),
                child: widget,
              ),
            ),
          )
          .toList(),
    );
  }
}
