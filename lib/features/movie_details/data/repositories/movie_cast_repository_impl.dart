import 'package:dartz/dartz.dart';
import 'package:tmdbtask/core/utils/helpers/enums.dart';
import 'package:tmdbtask/features/movie_details/data/models/movie_cast.dart';
import 'package:tmdbtask/features/movie_details/domain/repositories/base_movie_cast_repository.dart';

import '../../../../../../../core/networking/error_model/error_message_model.dart';
import '../data_sources/remote_data_source/movie_cast_remote_service.dart';

class MovieCastRepository implements BaseMovieCastRepository {
  final MovieCastRemoteService movieCastRemoteService;

  MovieCastRepository(this.movieCastRemoteService);

  @override
  Future<Either<ErrorMessageModel, MovieCastModel>> getMovieCast(
      {required int movieId}) async {
    final remoteResponse =
        await movieCastRemoteService.movieCastService(movieId: movieId);

    return remoteResponse.when(
      noConnection: () {
        return left(
          const ErrorMessageModel(
            status_message: 'No Internet Connection',
            success: false,
            errorType: PageStates.internetError
          ),
        );
      },
      failure: (message, success,errorType) {
        return left(
            ErrorMessageModel(status_message: message, success: success,
                errorType: errorType));
      },
      data: (movieCast) {
        return right(movieCast);
      },
    );
  }
}
