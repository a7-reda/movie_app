import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Resources/texts.dart';
import 'package:movies_app/cubit/Network/Videos/video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit() : super(VideoInitial());

  Future<void> getVideos(int movieId) async {
    final String url =
        "${AppTexts.baseUrl}/movie/$movieId/videos?api_key=${AppTexts.apiKey}&language=en-US&page=1";
    emit(VideoLoading());
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        emit(VideoLoaded(videos: data["results"]));
      } else {
        print(response.statusCode);
        print("================");
        emit(VideoError(message: "Failed to load videos"));
      }
    } catch (e) {
      print(e);
      print("================");
      emit(VideoError(message: "Error"));
    }
  }
}
