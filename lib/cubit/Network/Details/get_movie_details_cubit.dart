import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Resources/texts.dart';
import 'package:movies_app/cubit/Network/Details/get_movie_details_state.dart';

class DetailsCubit extends Cubit<MovieDetailsState> {
  DetailsCubit() : super(MovieInitial());

  Future<void> getDetails(int movieId) async {
    final String url =
        "${AppTexts.baseUrl}/movie/$movieId?api_key=${AppTexts.apiKey}&language=en-US&page=1";
    emit(MovieLoading());
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        emit(MovieLoaded(details: data));
      } else {
        print(response.statusCode);
        print("================");
        emit(MovieError("Failed to load details"));
      }
    } catch (e) {
      print(e);
      print("================");
      emit(MovieError("Error"));
    }
  }
}
