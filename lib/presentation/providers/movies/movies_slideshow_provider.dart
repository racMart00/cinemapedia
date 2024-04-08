import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/domain/entities/movie.dart';

import 'movies_providers.dart';

final moviesSlideShowProvider = Provider<List<Movie>>((ref){

  final nowPlayingMovies = ref.watch( nowPlayingMoviesProvider );
  
  if ( nowPlayingMovies.isEmpty ) return [];

  return nowPlayingMovies.sublist(0, 6);

});