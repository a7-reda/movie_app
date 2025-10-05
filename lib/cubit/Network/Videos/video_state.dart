import 'package:equatable/equatable.dart';

sealed class VideoState extends Equatable {
  @override
  List<Object> get props => [];
}

class VideoInitial extends VideoState {}

class VideoLoading extends VideoState {}

class VideoLoaded extends VideoState {
  final List<dynamic> videos;
  VideoLoaded({required this.videos});

  @override
  List<Object> get props => [videos];
}

class VideoError extends VideoState {
  final String message;
  VideoError({required this.message});

  @override
  List<Object> get props => [message];
}
