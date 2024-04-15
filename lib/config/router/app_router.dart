import "package:go_router/go_router.dart";

import "package:cinemapedia/presentation/screens/screens.dart";


final appRouter = GoRouter(
  initialLocation: '/home/0',
  routes: [

    //* Redirect '/' --> '/home/0'
    GoRoute(
      path: '/',
      redirect: ( _ , __ ) => '/home/0',
    ),

    //* Rutas padre/hijo
    GoRoute( //* Padre
      path: '/home/:page',
      name: HomeScreen.name,
      builder: (context, state) {
        final pageIndex = int.parse( state.pathParameters['page'] ?? '0' );

        return HomeScreen( pageIndex: pageIndex );
      },
      routes: [

        GoRoute( //* Hijo
          path: 'movie/:id',
          name: MovieScreen.name,
          builder: (context, state) {
            final movieId = state.pathParameters['id'] ?? 'no-id';

            return MovieScreen(movieId: movieId);
          },
        ),
        
      ]
    ),

  ]
);

//* ShellRouter
    // ShellRoute(
    //   builder: (context, state, child) {
    //     return HomeScreen(childView: child);
    //   },
    //   routes: [

    //     GoRoute(
    //       path: '/',
    //       builder: (context, state) {
    //         return const HomeView();
    //       },
    //       routes: [

    //         GoRoute(
    //           path: 'movie/:id',
    //           name: MovieScreen.name,
    //           builder: (context, state) {
    //             final movieId = state.pathParameters['id'] ?? 'no-id';

    //             return MovieScreen(movieId: movieId);
    //           },
    //         ),

    //       ]
    //     ),

    //     GoRoute(
    //       path: '/favorites',
    //       builder: (context, state) {
    //         return const FavoritesView();
    //       },
    //     ),

    //   ],
    // ),