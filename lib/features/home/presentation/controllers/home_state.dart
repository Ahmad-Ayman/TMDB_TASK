part of 'home_cubit.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeMoviesInitialState extends HomeState {}

class HomeMoviesLoadingState extends HomeState {
  final List<MovieDataModel> oldMovies;
  final bool isFirstFetch;

  const HomeMoviesLoadingState(this.oldMovies, {this.isFirstFetch = false});

  @override
  List<Object> get props => [oldMovies, isFirstFetch];
}

class HomeMoviesSuccessState extends HomeState {
  final List<MovieDataModel> movies;

  const HomeMoviesSuccessState(this.movies);

  @override
  List<Object> get props => [movies];
}

class HomeMoviesErrorState extends HomeState {
  final String msg;
  final PageStates errorType;
  const HomeMoviesErrorState(this.msg,this.errorType);

  @override
  List<Object> get props => [msg];
}
