import 'package:movie/src/model/movie.dart';
import 'package:movie/src/services/base_service.dart';
import 'package:movie/src/services/popular_service/popular_service.dart';

class PopularRepository{
  final BaseService _popularService = PopularService();

  Future<List<MovieResult>> fetchPopular()async{
    dynamic response = await _popularService.getResponse('/popular');
    final data = response['results'] as List;

    List<MovieResult> movie = data.map((e) => MovieResult.fromJson(e)).toList();
    return movie;
  }
}