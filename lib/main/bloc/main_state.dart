import 'package:ghibli_api/ghibli_api.dart';

abstract class MainState {}

class MainStateLoading extends MainState {}

class MainStateLoaded extends MainState {
  MainStateLoaded(this.films);

  final List<Film> films;
}

class MainStateError extends MainState {}
