import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/domain/domain.dart';
import './movies_providers.dart';

final moviesSlideshowProvider = Provider<List<Movie>>((ref) {
  final nowPlayingMovies = ref.watch(noPlayingMoviesProvider);

  if (nowPlayingMovies.isEmpty) return [];

  return nowPlayingMovies.sublist(0, 6);
});
