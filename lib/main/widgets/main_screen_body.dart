import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ghibli_bloc/main/bloc/main_bloc.dart';
import 'package:flutter_ghibli_bloc/main/bloc/main_state.dart';
import 'package:flutter_ghibli_bloc/main/widgets/film_widget.dart';
import 'package:flutter_ghibli_bloc/utils/strings.dart';
import 'package:ghibli_api/ghibli_api.dart';

class MainScreenBody extends StatelessWidget {
  const MainScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        if (state is MainStateLoading) {
          return const _MainStateLoadingWidget();
        } else if (state is MainStateLoaded) {
          return _MainStateLoadedWidget(
            films: state.films,
          );
        } else {
          return const _MainStateErrorWidget();
        }
      },
    );
  }
}

class _MainStateLoadedWidget extends StatelessWidget {
  const _MainStateLoadedWidget({
    required this.films,
    Key? key,
  }) : super(key: key);

  final List<Film> films;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: films.map((film) => FilmWidget(film: film)).toList(),
    );
  }
}

class _MainStateLoadingWidget extends StatelessWidget {
  const _MainStateLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _MainStateErrorWidget extends StatelessWidget {
  const _MainStateErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(AppStrings.somethingWentWrong),
    );
  }
}
