import 'package:dartz/dartz.dart';
import 'package:tmdbtask/features/movie_details/data/models/movie_cast.dart';

import '../../../../core/networking/error_model/error_message_model.dart';
import '../repositories/base_movie_cast_repository.dart';

class GetMovieCastUseCase {
  final BaseMovieCastRepository baseMovieCastRepository;

  GetMovieCastUseCase(this.baseMovieCastRepository);

  Future<Either<ErrorMessageModel, MovieCastModel>> executeGetMovieCastProcess(
      {required int movieId}) async {
    return await baseMovieCastRepository.getMovieCast(movieId: movieId);
  }
}
