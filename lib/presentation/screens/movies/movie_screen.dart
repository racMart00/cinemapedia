import 'package:flutter/material.dart';

class MovieScreen extends StatelessWidget {
  static const name = 'movie-screen';

  final String movieId;

  const MovieScreen({
    required this.movieId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie ID: $movieId'),
      ),
    );
  }
}