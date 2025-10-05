import 'package:equatable/equatable.dart';

sealed class ReviewState extends Equatable {
  @override
  List<Object> get props => [];
}

class ReviewInitial extends ReviewState {}

class ReviewLoading extends ReviewState {}

class ReviewLoaded extends ReviewState {
  final List reviews;
  ReviewLoaded(this.reviews);

  @override
  List<Object> get props => [reviews];
}

class ReviewError extends ReviewState {
  final String message;
  ReviewError(this.message);

  @override
  List<Object> get props => [message];
}
