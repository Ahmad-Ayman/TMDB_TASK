import 'package:dartz/dartz.dart';
import 'package:tmdbtask/features/movie_details/data/models/movie_cast.dart';

import '../../../../core/networking/error_model/error_message_model.dart';

abstract class BaseMovieCastRepository {
  Future<Either<ErrorMessageModel, MovieCastModel>> getMovieCast(
      {required int movieId});
}
