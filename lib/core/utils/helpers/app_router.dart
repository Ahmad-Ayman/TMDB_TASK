import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tmdbtask/core/utils/helpers/enums.dart';
import 'package:tmdbtask/features/home/data/models/movies_model.dart';
import 'package:tmdbtask/features/movie_details/presentation/screens/movie_details_screen.dart';

import '../../../features/home/presentation/screens/home_screen.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
          path: '/',
          name: Routes.MyAppScreen.name,
          builder: (context, state) => HomeScreen()),
      GoRoute(
        path: '/movieDetails',
        name: Routes.MovieDetailsScreen.name,
        pageBuilder: (context, state) {
          MovieDataModel movieDataModel = state.extra as MovieDataModel;
          return CustomTransitionPage<void>(
            key: state.pageKey,
            child: MovieDetailsScreen(
              movieData: movieDataModel,
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    ScaleTransition(scale: animation, child: child),
          );
        },
      ),
    ],
  );
}
