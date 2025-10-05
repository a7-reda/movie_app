import 'package:equatable/equatable.dart';

sealed class ActorState extends Equatable {
  const ActorState();

  @override
  List<Object> get props => [];
}

class ActorInitial extends ActorState {}

class ActorLoading extends ActorState {}

class ActorLoaded extends ActorState {
  final List actorsList;
  const ActorLoaded({required this.actorsList});
  @override
  List<Object> get props => [actorsList];
}

class ActorError extends ActorState {
  final String message;
  const ActorError({required this.message});
  @override
  List<Object> get props => [message];
}
