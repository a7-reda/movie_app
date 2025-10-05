import 'package:equatable/equatable.dart';

sealed class MovieDetailsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MovieInitial extends MovieDetailsState {}

class MovieLoading extends MovieDetailsState {}

class MovieLoaded extends MovieDetailsState {
  final Map<String, dynamic> details;


  MovieLoaded({required this.details});

  @override
  List<Object?> get props => [details];
}

class MovieError extends MovieDetailsState {
  final String message;

  MovieError(this.message);

  @override
  List<Object?> get props => [message];
}
