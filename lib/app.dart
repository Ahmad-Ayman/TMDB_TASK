import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdbtask/core/utils/helpers/app_router.dart';
import 'package:tmdbtask/features/home/presentation/controllers/home_cubit.dart';

import 'core/services/dependency_injection.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit(sl())..getHomeMovies()),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        title: 'TMDB Task',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: const ColorScheme.dark(),
          useMaterial3: true,
        ),
      ),
    );
  }
}

