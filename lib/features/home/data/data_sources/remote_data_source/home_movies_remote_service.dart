import 'package:tmdbtask/core/utils/helpers/enums.dart';
import 'package:tmdbtask/features/home/data/models/movies_model.dart';

import '../../../../../../../../core/networking/api_constants.dart';
import '../../../../../../../../core/networking/network_service.dart';
import '../../../../../../../../core/networking/remote_response.dart';

class HomeMoviesRemoteService {
  final RemoteService _service;

  HomeMoviesRemoteService(this._service);

  Future<RemoteResponse<MoviesModel>> homeMoviesService({int page = 1}) async {
    final remoteResponse =
        await _service.dioGet(ApiConstants.upcomingMovies(page: page));

    return remoteResponse.when(
      noConnection: () => const RemoteResponse.noConnection(),
      failure: (message, success,errorType) => RemoteResponse.failure(message,
        success,errorType),
      data: (data) {
        if (data is! Map<String, dynamic>) {
          return const RemoteResponse.failure('Unknown Error', false,
              PageStates.error);
        }
        final homeMovies = MoviesModel.fromJson(data);

        return RemoteResponse.data(homeMovies);
      },
    );
  }
}
