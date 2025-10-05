import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubit/fav/fav_state.dart';


class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(const FavoritesState());

  void toggleFavorite(Map<String, dynamic> movie) {
    final exists = state.favorites.any((m) => m["id"] == movie["id"]);
    if (exists) {
      final updated = state.favorites.where((m) => m["id"] != movie["id"]).toList();
      emit(state.copyWith(favorites: updated, isFavorite: false));
    } else {
      final updated = [...state.favorites, movie];
      emit(state.copyWith(favorites: updated, isFavorite: true));
    }
  }

  void checkIfFavorite(int id) {
    final exists = state.favorites.any((m) => m["id"] == id);
    emit(state.copyWith(isFavorite: exists));
  }
}
