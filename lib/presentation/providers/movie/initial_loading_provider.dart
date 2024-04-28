import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';

final initialLoadingProvider = Provider((ref) {
  final nowPlayingMovies = ref.watch(noPlayingMoviesProvider).isEmpty;
  //! Popular movies
  final popularMovies = ref.watch(popularMoviesProvider).isEmpty;
  //! To rated movies
  final toRatedMovies = ref.watch(toRatedMoviesProvider).isEmpty;
  //! Up comming
  final upComingMovies = ref.watch(upComingMoviesProvider).isEmpty;

  if (nowPlayingMovies || popularMovies || toRatedMovies || upComingMovies) {
    return true;
  }
  return false;
});
