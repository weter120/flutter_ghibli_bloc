import 'package:ghibli_api/src/entity/film.dart';
import 'package:ghibli_api/src/mapper/mapper.dart';

class JsonToFilmListMapper implements Mapper<List<dynamic>, List<Film>> {
  JsonToFilmListMapper(this._jsonToFilmMapper);

  final Mapper<Map<String, dynamic>, Film> _jsonToFilmMapper;

  @override
  List<Film> transform(List<dynamic> value) {
    final films = <Film>[];
    for (final jsonMap in value) {
      final film = _jsonToFilmMapper.transform(jsonMap as Map<String, dynamic>);
      films.add(film);
    }
    return films;
  }
}
