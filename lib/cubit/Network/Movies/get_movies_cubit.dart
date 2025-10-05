import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Resources/texts.dart';
import 'package:movies_app/cubit/Network/Movies/get_movies_state.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit() : super(MoviesInitial());

  Future<void> getPopularMovies() async {
    final String url =
        "${AppTexts.baseUrl}/movie/popular?api_key=${AppTexts.apiKey}&language=en-US&page=1";
    emit(MoviesLoading());
    try {
      final response = await http.get(
        Uri.parse(url),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        emit(MoviesLoaded(data["results"]));
      } else {
        print(response.statusCode);
        print("================");
        emit(MoviesError("Failed to load movies"));
      }
    } catch (e) {
      print(e);
      print("================");
      emit(MoviesError("Error"));
    }
  }

  Future<void> getTopRatedMovies() async {
    final String url =
        "${AppTexts.baseUrl}/movie/top_rated?api_key=${AppTexts.apiKey}&language=en-US&page=1";
    emit(MoviesLoading());
    try {
      final response = await http.get(
        Uri.parse(url),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        emit(MoviesLoaded(data["results"]));
      } else {
        print(response.statusCode);
        print("================");
        emit(MoviesError("Failed to load movies"));
      }
    } catch (e) {
      print(e);
      print("================");
      emit(MoviesError("Error"));
    }
  }

}
