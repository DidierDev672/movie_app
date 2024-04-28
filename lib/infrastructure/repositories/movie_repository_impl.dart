import 'package:movie_app/domain/domain.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieDataSource dataSource;
  MovieRepositoryImpl(this.dataSource);
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return dataSource.getNowPlaying(page: page);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return dataSource.getPopular(page: page);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return dataSource.getTopRated(page: page);
  }

  @override
  Future<List<Movie>> getUpcomming({int page = 1}) {
    return dataSource.getUpcomming(page: page);
  }

  @override
  Future<Movie> getMovieById(String id) {
    return dataSource.getMovieById(id);
  }

  @override
  Future<List<Movie>> searchMovies(String query) {
    return dataSource.searchMovies(query);
  }
}
