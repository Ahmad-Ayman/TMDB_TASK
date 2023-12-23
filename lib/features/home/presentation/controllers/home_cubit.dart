import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdbtask/core/utils/helpers/enums.dart';
import 'package:tmdbtask/features/home/data/models/movies_model.dart';

import '../../domain/use_cases/get_home_movies_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.getHomeMoviesUseCase) : super(HomeMoviesInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  final GetHomeMoviesUseCase getHomeMoviesUseCase;
  int currentPage = 1;
  List<MovieDataModel> allMovies = [];

  void getHomeMovies() async {
    if (state is HomeMoviesLoadingState) return;

    final currentState = state;

    var oldMovies = <MovieDataModel>[];
    if (currentState is HomeMoviesSuccessState) {
      oldMovies = currentState.movies;
    }

    emit(HomeMoviesLoadingState(oldMovies, isFirstFetch: currentPage == 1));

    final result = await getHomeMoviesUseCase.executeGetHomeMoviesProcess(
        page: currentPage);
    result.fold((failure) {

      emit(HomeMoviesErrorState(failure.status_message,failure.errorType));
    }, (data) {
      currentPage++;
      allMovies = (state as HomeMoviesLoadingState).oldMovies;
      allMovies.addAll(data.moviesDataModel!);

      emit(HomeMoviesSuccessState(allMovies));
    });
  }

  void searchMovies(String query) {
    emit(HomeMoviesLoadingState(allMovies, isFirstFetch: currentPage == 1));

    if( query.isNotEmpty) {
      final List<MovieDataModel> filteredMovies = allMovies
          .where(
              (movie) =>
              movie.title!.toLowerCase().contains(query.toLowerCase()))
          .toList();
      if (filteredMovies.isNotEmpty) {
        emit(HomeMoviesSuccessState(filteredMovies));
      } else {
        emit(const HomeMoviesErrorState('No Data Found', PageStates.noData));
      }
    }else{
      emit(HomeMoviesSuccessState(allMovies));
    }
  }

  @override
  void onChange(Change<HomeState> change) {
    super.onChange(change);
    debugPrint('bloc change : $change');
  }
}
