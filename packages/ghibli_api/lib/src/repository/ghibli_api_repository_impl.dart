import 'package:dio/dio.dart';
import 'package:ghibli_api/src/entity/film.dart';
import 'package:ghibli_api/src/mapper/mapper.dart';
import 'package:ghibli_api/src/repository/ghibli_api_repository.dart';

class GhibliApiRepositoryImpl implements GhibliApiRepository {
  GhibliApiRepositoryImpl(
    this._jsonToFilmListMapper,
  );

  final Mapper<List<dynamic>, List<Film>> _jsonToFilmListMapper;

  final _apiClient = Dio(
    BaseOptions(
      baseUrl: 'https://ghibliapi.herokuapp.com',
    ),
  );

  @override
  Future<List<Film>> getFilms() async {
    final response = await _apiClient.get('/films');
    return _jsonToFilmListMapper.transform(response.data as List<dynamic>);
  }
}
