import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia/presentation/providers/movies/movie_info_provider.dart';

import 'package:cinemapedia/domain/entities/movie.dart';

class MovieScreen extends ConsumerStatefulWidget {
  static const name = 'movie-screen';

  final String movieId;

  const MovieScreen({
    required this.movieId,
    super.key,
  });

  @override
  MovieScreenState createState() => MovieScreenState();
}

class MovieScreenState extends ConsumerState<MovieScreen> {
  @override
  void initState() {
    super.initState();

    ref.read( movieInfoProvider.notifier ).loadMovie( widget.movieId );
  }

  @override
  Widget build(BuildContext context) {
    final Movie? movie = ref.watch( movieInfoProvider )[ widget.movieId ];

    if(movie == null){
      return const Scaffold(body: Center( child: CircularProgressIndicator( strokeWidth: 2 ) ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Movie ID: ${widget.movieId}'),
      ),
    );
  }
}