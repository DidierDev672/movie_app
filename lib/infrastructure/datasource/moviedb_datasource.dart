import 'package:dio/dio.dart';
import 'package:movie_app/config/constant/environment.dart';
import 'package:movie_app/domain/domain.dart';
import 'package:movie_app/infrastructure/mappers/movie_mapper.dart';
import 'package:movie_app/infrastructure/models/moviedb/moviedb_response.dart';

class MoviedbDataSource extends MovieDataSource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environment.theMovieDbKey,
      'language': 'es-MX'
    },
  ));
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/no_playing');
    final movieDBResponse = MovieDbResponse.fromJson(response.data);
    final List<Movie> movies = movieDBResponse.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map(
          (moviedb) => MovieMapper.movieDBToEntity(moviedb),
        )
        .toList();
    return movies;
  }
}
