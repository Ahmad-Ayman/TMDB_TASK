import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdbtask/features/movie_details/data/models/movie_cast.dart';
import 'package:tmdbtask/features/movie_details/domain/use_cases/get_movie_cast_use_case.dart';

part 'moviecast_state.dart';

class MoviecastCubit extends Cubit<MoviecastState> {
  MoviecastCubit(this.getMovieCastUseCase) : super(MoviecastInitial());

  static MoviecastCubit get(context) => BlocProvider.of(context);

  final GetMovieCastUseCase getMovieCastUseCase;

  MovieCastModel? movieCastModel;
  void getMovieCast({required int movieId}) async {
    emit(MovieCastLoadingState());
    final result =
        await getMovieCastUseCase.executeGetMovieCastProcess(movieId: movieId);
    result.fold((failure) {
      emit(MovieCastErrorState(failure.status_message));
    }, (data) {
      movieCastModel = data;
      emit(MovieCastSuccessState());
    });
  }

  @override
  void onChange(Change<MoviecastState> change) {
    super.onChange(change);
    debugPrint('cast bloc change : $change');
  }
}
