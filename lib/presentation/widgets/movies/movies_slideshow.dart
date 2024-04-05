import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import 'package:cinemapedia/domain/entities/movie.dart';

class MoviesSlideshow extends StatelessWidget {
  final List<Movie> movies;

  const MoviesSlideshow({
    required this.movies,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.9,
        autoplay: true,
        itemCount: movies.length,
        itemBuilder: (context, index) => _Slide(movie: movies[index]),
      )
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;

  const _Slide({
    required this.movie
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}