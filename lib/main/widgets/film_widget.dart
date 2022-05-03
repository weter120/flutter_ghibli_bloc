import 'package:flutter/material.dart';
import 'package:flutter_ghibli_bloc/film/screens/film_screen.dart';
import 'package:flutter_ghibli_bloc/utils/assets.dart';
import 'package:flutter_ghibli_bloc/utils/constrains.dart';
import 'package:ghibli_api/ghibli_api.dart';

class FilmWidget extends StatelessWidget {
  static const _maxWidth = 400.0;

  const FilmWidget({
    required this.film,
    Key? key,
  }) : super(key: key);

  final Film film;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: _maxWidth,
        ),
        padding: const EdgeInsets.all(AppPadding.medium),
        child: GestureDetector(
          onTap: () => Navigator.push(context, FilmScreen.route(film)),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              _MovieBannerWidget(
                movieBannerUrl: film.movieBanner,
              ),
              _HeaderWidget(
                title: film.title,
                originalTitle: film.originalTitle,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({
    required this.title,
    required this.originalTitle,
    Key? key,
  }) : super(key: key);

  final String title;
  final String originalTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline5!.copyWith(
                color: Colors.white,
              ),
        ),
        Text(
          originalTitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: Colors.white,
              ),
        ),
      ],
    );
  }
}

class _MovieBannerWidget extends StatelessWidget {
  static const _aspectRatio = 16 / 9;

  const _MovieBannerWidget({
    required this.movieBannerUrl,
    Key? key,
  }) : super(key: key);

  final String movieBannerUrl;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: _aspectRatio,
      child: Image.network(
        movieBannerUrl,
        colorBlendMode: BlendMode.hardLight,
        color: AppColors.black40,
        errorBuilder: (context, _, __) {
          return Image.asset(
            AppAssets.imgPlaceholder,
            colorBlendMode: BlendMode.hardLight,
            color: AppColors.black40,
            fit: BoxFit.fill,
          );
        },
      ),
    );
  }
}
