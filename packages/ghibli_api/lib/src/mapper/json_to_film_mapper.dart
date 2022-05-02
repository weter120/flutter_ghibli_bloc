import 'package:ghibli_api/src/entity/film.dart';
import 'package:ghibli_api/src/mapper/mapper.dart';

class JsonToFilmMapper implements Mapper<Map<String, dynamic>, Film> {
  static const String _idKey = 'id';
  static const String _titleKey = 'title';
  static const String _originalTitleKey = 'original_title';
  static const String _originalTileRomanisedKey = 'original_title_romanised';
  static const String _descriptionKey = 'description';
  static const String _directorKey = 'director';
  static const String _producerKey = 'producer';
  static const String _runningTimeKey = 'running_time';
  static const String _releaseDateKey = 'release_date';
  static const String _rtScoreKey = 'rt_score';
  static const String _imageKey = 'image';
  static const String _movieBannerKey = 'movie_banner';

  @override
  Film transform(Map<String, dynamic> jsonMap) {
    final id = jsonMap[_idKey] as String;
    final title = jsonMap[_titleKey] as String;
    final originalTitle = jsonMap[_originalTitleKey] as String;
    final originalTitleRomanised = jsonMap[_originalTileRomanisedKey] as String;
    final description = jsonMap[_descriptionKey] as String;
    final director = jsonMap[_directorKey] as String;
    final producer = jsonMap[_producerKey] as String;
    final releaseDate = jsonMap[_releaseDateKey] as String;
    final runningTime = jsonMap[_runningTimeKey] as String;
    final rtScore = jsonMap[_rtScoreKey] as String;
    final image = jsonMap[_imageKey] as String;
    final movieBanner = jsonMap[_movieBannerKey] as String;
    return Film(
      id: id,
      title: title,
      originalTitle: originalTitle,
      originalTitleRomanised: originalTitleRomanised,
      description: description,
      director: director,
      producer: producer,
      releaseDate: releaseDate,
      runningTime: runningTime,
      rtScore: rtScore,
      image: image,
      movieBanner: movieBanner,
    );
  }
}
