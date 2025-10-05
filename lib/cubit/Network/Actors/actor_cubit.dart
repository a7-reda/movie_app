import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:movies_app/Resources/texts.dart';
import 'package:movies_app/cubit/Network/Actors/actor_state.dart';

class ActorCubit extends Cubit<ActorState> {
  ActorCubit() : super(ActorInitial());

  Future<void> getCast(int movieId) async {
    final String url =
        "${AppTexts.baseUrl}/movie/$movieId/credits?api_key=${AppTexts.apiKey}&language=en-US&page=1";
    emit(ActorLoading());
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        emit(ActorLoaded(actorsList: data["cast"]));
      } else {
        print(response.statusCode);
        print("================");
        emit(ActorError(message: "Failed to load movies"));
      }
    } catch (e) {
      print(e);
      print("================");
      emit(ActorError(message: "Error"));
    }
  }
}
