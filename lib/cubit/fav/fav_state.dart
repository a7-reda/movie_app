import 'package:equatable/equatable.dart';

class FavoritesState extends Equatable {
  final List<Map<String, dynamic>> favorites;
  final bool isFavorite;

  const FavoritesState({
    this.favorites = const [],
    this.isFavorite = false,
  });

  FavoritesState copyWith({
    List<Map<String, dynamic>>? favorites,
    bool? isFavorite,
  }) {
    return FavoritesState(
      favorites: favorites ?? this.favorites,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  List<Object> get props => [favorites, isFavorite];
}
