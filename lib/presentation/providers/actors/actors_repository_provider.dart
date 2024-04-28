//? Este repositorio es inmutable
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/infrastructure/infrastructure.dart';

final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(ActorMovieDbDatasource());
});
