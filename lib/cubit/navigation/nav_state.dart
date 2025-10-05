import 'package:equatable/equatable.dart';

sealed class NavState extends Equatable {
  final int index;
  const NavState(this.index);

  @override
  List<Object?> get props => [index];
}

class NavInitial extends NavState {
  const NavInitial() : super(0);
}

class NavChanged extends NavState {
  const NavChanged(int index) : super(index);
}
