import 'package:flutter/material.dart';

import 'package:cinemapedia/domain/entities/movie.dart';

class MovieHorizontalListview extends StatelessWidget {

  final List<Movie> movies;
  final String? title;
  final String? subTitle;
  final VoidCallback? loadNextpage;

  const MovieHorizontalListview({
    required this.movies,
    this.title,
    this.subTitle,
    this.loadNextpage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [

          if( title != null || subTitle != null )
            _Title( title: title, subTitle: subTitle ),

        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subTitle;

  const _Title({
    this.title,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return Container(
      padding: const EdgeInsets.only( top: 10 ),
      margin: const EdgeInsets.symmetric( horizontal: 10 ),
      child: Row(
        children: [

          if( title != null )
            Text( title!, style: titleStyle ),
          
          const Spacer(),

          if( subTitle != null )
            FilledButton.tonal(
              style: const ButtonStyle( visualDensity: VisualDensity.compact ),
              onPressed: (){},
              child: Text( subTitle! ),
            ),
          
        ],
      ),
    );
  }
}