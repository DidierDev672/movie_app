import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/infrastructure/infrastructure.dart';

final localStorageRepositoryProvider = Provider((ref) {
  return LocalStorageRepositoryImpl(IsarDatasource());
});
