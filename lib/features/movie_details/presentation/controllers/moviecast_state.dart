part of 'moviecast_cubit.dart';

@immutable
abstract class MoviecastState {}

class MoviecastInitial extends MoviecastState {}

class MovieCastLoadingState extends MoviecastState {}

class MovieCastSuccessState extends MoviecastState {}

class MovieCastErrorState extends MoviecastState {
  final String msg;
  MovieCastErrorState(this.msg);
}
