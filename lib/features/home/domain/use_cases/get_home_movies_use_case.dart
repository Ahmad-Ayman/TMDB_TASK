import 'package:dartz/dartz.dart';
import 'package:tmdbtask/features/home/data/models/movies_model.dart';

import '../../../../core/networking/error_model/error_message_model.dart';
import '../repositories/base_home_repository.dart';

class GetHomeMoviesUseCase {
  final BaseHomeRepository baseHomeRepository;

  GetHomeMoviesUseCase(this.baseHomeRepository);

  Future<Either<ErrorMessageModel, MoviesModel>> executeGetHomeMoviesProcess(
      {int page = 1}) async {
    return await baseHomeRepository.getHomeMovies(page: page);
  }
}
