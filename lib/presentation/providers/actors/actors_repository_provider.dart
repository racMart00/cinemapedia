import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia/infrastructure/repositories/actor_repository_impl.dart';
import 'package:cinemapedia/infrastructure/datasources/actor_moviedb_datasource.dart';

//Este repositorio es inmutable (solo lectura)
final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl( ActorMovieDbDatasource() );
});
