import 'package:dartz/dartz.dart';
import 'package:tmdbtask/features/home/data/models/movies_model.dart';

import '../../../../core/networking/error_model/error_message_model.dart';

abstract class BaseHomeRepository {
  Future<Either<ErrorMessageModel, MoviesModel>> getHomeMovies({int page = 1});
}
