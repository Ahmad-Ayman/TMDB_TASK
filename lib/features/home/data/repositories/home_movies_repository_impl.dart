import 'package:dartz/dartz.dart';
import 'package:tmdbtask/features/home/data/models/movies_model.dart';
import 'package:tmdbtask/features/home/domain/repositories/base_home_repository.dart';

import '../../../../../../../core/networking/error_model/error_message_model.dart';
import '../data_sources/remote_data_source/home_movies_remote_service.dart';

class HomeRepository implements BaseHomeRepository {
  final HomeMoviesRemoteService homeMoviesRemoteService;

  HomeRepository(this.homeMoviesRemoteService);

  @override
  Future<Either<ErrorMessageModel, MoviesModel>> getHomeMovies(
      {int page = 1}) async {
    final remoteResponse =
        await homeMoviesRemoteService.homeMoviesService(page: page);

    return remoteResponse.when(
      noConnection: () {
        return left(
          const ErrorMessageModel(
            status_message: 'No Internet Connection',
            success: false,
          ),
        );
      },
      failure: (message, success) {
        return left(
            ErrorMessageModel(status_message: message, success: success));
      },
      data: (moviesData) {
        return right(moviesData);
      },
    );
  }
}
