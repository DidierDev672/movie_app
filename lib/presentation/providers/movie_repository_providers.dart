import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/infrastructure/infrastructure.dart';

// * Este repositories es immutable.
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MoviedbDataSource());
});
