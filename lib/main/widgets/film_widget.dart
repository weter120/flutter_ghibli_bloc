import 'package:flutter/material.dart';
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
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            _MovieBannerWidget(
              movieBannerUrl: film.movieBanner,
            ),
            Text(
              film.title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ],
        ),
      ),
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
