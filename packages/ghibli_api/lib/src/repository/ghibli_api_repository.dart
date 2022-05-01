import 'package:ghibli_api/src/entity/film.dart';
import 'package:ghibli_api/src/mapper/json_to_film_mapper.dart';
import 'package:ghibli_api/src/mapper/json_to_films_mapper.dart';
import 'package:ghibli_api/src/repository/ghibli_api_repository_impl.dart';

abstract class GhibliApiRepository {
  static final GhibliApiRepository _instance = GhibliApiRepositoryImpl(
    JsonToFilmListMapper(JsonToFilmMapper()),
  );

  factory GhibliApiRepository() => _instance;

  Future<List<Film>> getFilms();
}
