import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubit/navigation/nav_state.dart';

class NavCubit extends Cubit<NavState> {
  NavCubit() : super(NavInitial());

  changeTab(int index) {
    emit(NavChanged(index));
  }
}
