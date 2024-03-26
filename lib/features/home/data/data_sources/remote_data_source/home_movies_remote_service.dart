import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:tmdbtask/core/utils/helpers/enums.dart';
import 'package:tmdbtask/features/home/data/models/movies_model.dart';

import '../../../../../../../../core/networking/api_constants.dart';
import '../../../../../../../../core/networking/network_service.dart';
import '../../../../../../../../core/networking/remote_response.dart';
import '../../../../../core/services/dependency_injection.dart';
import '../../../../../core/utils/caching2/cache_manager.dart';

class HomeMoviesRemoteService {
  final RemoteService _service;

  // final MySharedPreferences mySharedPreferences;
  final AppDatabase _database;

  HomeMoviesRemoteService(this._service, this._database);

  Future<RemoteResponse<MoviesModel>> homeMoviesService({int page = 1}) async {
    final remoteResponse =
        await _service.dioGet(ApiConstants.upcomingMovies(page: page));

    return remoteResponse.when(
      noConnection: () => const RemoteResponse.noConnection(),
      failure: (message, success, errorType) =>
          RemoteResponse.failure(message, success, errorType),
      data: (data) async {
        if (data is! Map<String, dynamic>) {
          return const RemoteResponse.failure(
              'Unknown Error', false, PageStates.error);
        }
        final homeMovies = MoviesModel.fromJson(data);



String u =ApiConstants.upcomingMovies(page: page);
String r =  jsonEncode(homeMovies.toJson());
DateTime exp = DateTime.now().add(Duration(minutes: 5));
await _database.clearExpiredCache(u);
CacheEntry enty = CacheEntry(url: u,response: r,expiration: exp,id: 1);
        await _database.insertCache(enty).then((value) async {
          print('inserted in Cache');
          print(
              '${await _database.getCache(ApiConstants.upcomingMovies(page: page))}');
        });

        return RemoteResponse.data(homeMovies);
      },
    );
  }
}

class HomeMoviesLocalService {
  final AppDatabase _database;

  HomeMoviesLocalService(this._database);

  Future<RemoteResponse<MoviesModel>> homeMoviesService({int page = 1}) async {
    // final remoteResponse =
    // await _service.dioGet(ApiConstants.upcomingMovies(page: page));

    await _database.clearExpiredCache(ApiConstants.upcomingMovies(page: page));
    final localRepsonse =
        await _database.getCache(ApiConstants.upcomingMovies(page: page));

    return localRepsonse.when(
      noConnection: () => const RemoteResponse.noConnection(),
      failure: (message, success, errorType) =>
          RemoteResponse.failure(message, success, errorType),
      data: (data) {
        dynamic decoded = jsonDecode(data!.response);
        if (decoded is! Map<String, dynamic>) {
          return const RemoteResponse.failure(
              'Unknown Error', false, PageStates.error);
        }
        final homeMovies = MoviesModel.fromJson(decoded);

        return RemoteResponse.data(homeMovies);
      },
    );
  }
}
