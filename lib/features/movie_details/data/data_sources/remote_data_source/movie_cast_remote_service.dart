import 'package:tmdbtask/core/utils/helpers/enums.dart';
import 'package:tmdbtask/features/movie_details/data/models/movie_cast.dart';

import '../../../../../../../../core/networking/api_constants.dart';
import '../../../../../../../../core/networking/network_service.dart';
import '../../../../../../../../core/networking/remote_response.dart';

class MovieCastRemoteService {
  final RemoteService _service;

  MovieCastRemoteService(this._service);

  Future<RemoteResponse<MovieCastModel>> movieCastService(
      {required int movieId}) async {
    final remoteResponse =
        await _service.dioGet(ApiConstants.movieCast(movieId: movieId));

    return remoteResponse.when(
      noConnection: () => const RemoteResponse.noConnection(),
      failure: (message, success,errorType) => RemoteResponse.failure(message,
          success,errorType),
      data: (data) {
        if (data is! Map<String, dynamic>) {
          return const RemoteResponse.failure('Unknown Error', false,
              PageStates.error);
        }
        final movieCast = MovieCastModel.fromJson(data);

        return RemoteResponse.data(movieCast);
      },
    );
  }
}
