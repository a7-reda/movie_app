import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Resources/texts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:movies_app/cubit/Network/Reviews/review_state.dart';

class ReviewCubit extends Cubit<ReviewState> {
  ReviewCubit() : super(ReviewInitial());

  Future<void> getReviews(int movieId) async {
    final String url =
        "${AppTexts.baseUrl}/movie/$movieId/reviews?api_key=${AppTexts.apiKey}&language=en-US&page=1";
    emit(ReviewLoading());
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        emit(ReviewLoaded(data["results"]));
      } else {
        print(response.statusCode);
        print("================");
        emit(ReviewError("Failed to load reviews"));
      }
    } catch (e) {
      print(e);
      print("================");
      emit(ReviewError("Error"));
    }
  }
}
