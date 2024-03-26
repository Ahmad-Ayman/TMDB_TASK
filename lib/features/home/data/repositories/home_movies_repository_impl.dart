import 'package:dartz/dartz.dart';
import 'package:tmdbtask/core/networking/api_constants.dart';
import 'package:tmdbtask/core/utils/caching2/cache_manager.dart';
import 'package:tmdbtask/core/utils/caching2/cache_model.dart';
import 'package:tmdbtask/core/utils/helpers/enums.dart';
import 'package:tmdbtask/features/home/data/models/movies_model.dart';
import 'package:tmdbtask/features/home/domain/repositories/base_home_repository.dart';

import '../../../../../../../core/networking/error_model/error_message_model.dart';
import '../../../../core/networking/api_constants.dart';
import '../data_sources/remote_data_source/home_movies_remote_service.dart';

class HomeRepository implements BaseHomeRepository {
  final HomeMoviesRemoteService homeMoviesRemoteService;
  final HomeMoviesLocalService homeMoviesLocalService;

  // final GenericCacheManager genericCacheManager;
  HomeRepository(this.homeMoviesRemoteService, this.homeMoviesLocalService);

  @override
  Future<Either<ErrorMessageModel, MoviesModel>> getHomeMovies(
      {int page = 1}) async {
    // final remoteResponse =
    // await homeMoviesRemoteService.homeMoviesService(page: page);

    final res = await homeMoviesLocalService.homeMoviesService(page: page);

    return res.when(
      noConnection: () {
        print('no connection in cache');
        return left(
          const ErrorMessageModel(
              status_message: 'No Internet Connection',
              success: false,
              errorType: PageStates.internetError),
        );
      },
      // recentPrograms?pageNumber=1 + response
      // recentPrograms?pageNumber=2 + response
      failure: (message, success, errorType) async {
        print('fail in cache ${message}');
        final remoteResponse =
            await homeMoviesRemoteService.homeMoviesService(page: page);
        return remoteResponse.when(
          noConnection: () {
            return left(
              const ErrorMessageModel(
                  status_message: 'No Internet Connection',
                  success: false,
                  errorType: PageStates.internetError),
            );
          },
          failure: (message, success, errorType) {
            print('fail in remote');
            return left(ErrorMessageModel(
                status_message: message,
                success: success,
                errorType: errorType));
          },
          data: (moviesData) {
            print('success in remote');

            return right(moviesData);
          },
        );
      },
      data: (moviesData) {
        print('success in cache');
        return right(moviesData);
      },
    );
  }
}
