import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read( nowPlayingMoviesProvider.notifier ).loadNextPage();
    ref.read( popularMoviesProvider.notifier ).loadNextPage();
    ref.read( topRatedMoviesProvider.notifier ).loadNextPage();
    ref.read( upcomingMoviesProvider.notifier ).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {

    final initialLoading = ref.watch(initialLoadingProvider);
    if(initialLoading) return const FullScreenLoader();

    final slideShowMovies = ref.watch( moviesSlideShowProvider );
    final nowPlayingMovies = ref.watch( nowPlayingMoviesProvider );
    final popularMovies = ref.watch( popularMoviesProvider );
    final topRatedMovies = ref.watch( topRatedMoviesProvider );
    final upcomingMovies = ref.watch( upcomingMoviesProvider );

    return CustomScrollView(
      slivers: [

        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.all(0),
            title: CustomAppbar(),
          ),
        ),

        SliverList(
          delegate: SliverChildBuilderDelegate((context, index){
            return Column(
              children: [

                // const CustomAppbar(),
            
                MoviesSlideshow( movies: slideShowMovies ),
            
                MovieHorizontalListview(
                  movies: popularMovies,
                  title: 'Populares',
                  // subTitle: 'Lunes 20',
                  loadNextpage: () => ref.read( popularMoviesProvider.notifier ).loadNextPage(),
                ),

                MovieHorizontalListview(
                  movies: nowPlayingMovies,
                  title: 'En Estreno',
                  // subTitle: 'Desde Siempre',
                  loadNextpage: () => ref.read( nowPlayingMoviesProvider.notifier ).loadNextPage(),
                ),

                MovieHorizontalListview(
                  movies: topRatedMovies,
                  title: 'Mejor Calificacion',
                  // subTitle: 'Desde Siempre',
                  loadNextpage: () => ref.read( topRatedMoviesProvider.notifier ).loadNextPage(),
                ),

                MovieHorizontalListview(
                  movies: upcomingMovies,
                  title: 'Por Salir',
                  // subTitle: 'Desde Siempre',
                  loadNextpage: () => ref.read( upcomingMoviesProvider.notifier ).loadNextPage(),
                ),

                const SizedBox( height: 10 ),

              ],
            );
          },
          childCount: 1,
          )),
      ],
    );
  }
}