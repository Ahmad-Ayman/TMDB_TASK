import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tmdbtask/features/home/data/data_sources/remote_data_source/home_movies_remote_service.dart';
import 'package:tmdbtask/features/home/data/repositories/home_movies_repository_impl.dart';
import 'package:tmdbtask/features/home/domain/repositories/base_home_repository.dart';
import 'package:tmdbtask/features/home/domain/use_cases/get_home_movies_use_case.dart';
import 'package:tmdbtask/features/home/presentation/controllers/home_cubit.dart';
import 'package:tmdbtask/features/movie_details/data/data_sources/remote_data_source/movie_cast_remote_service.dart';
import 'package:tmdbtask/features/movie_details/data/repositories/movie_cast_repository_impl.dart';
import 'package:tmdbtask/features/movie_details/domain/repositories/base_movie_cast_repository.dart';
import 'package:tmdbtask/features/movie_details/domain/use_cases/get_movie_cast_use_case.dart';

import '../networking/network_service.dart';

final sl = GetIt.instance;

class ServicesLocator {
  init() {
    /// Cubits
    sl.registerFactory(() => HomeCubit(sl()));

    /// Use cases
    sl.registerLazySingleton(() => GetHomeMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieCastUseCase(sl()));

    ///Repository
    sl.registerLazySingleton<BaseHomeRepository>(() => HomeRepository(sl()));
    sl.registerLazySingleton<BaseMovieCastRepository>(
        () => MovieCastRepository(sl()));

    ///DataSource
    sl.registerLazySingleton<HomeMoviesRemoteService>(
        () => HomeMoviesRemoteService(sl()));
    sl.registerLazySingleton<MovieCastRemoteService>(
        () => MovieCastRemoteService(sl()));

    sl.registerFactory(() => RemoteService(Dio()));
  }
}
