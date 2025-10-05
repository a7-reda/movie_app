import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/Resources/texts.dart';
import 'package:movies_app/UI/Custom/custom_text.dart';
import 'package:movies_app/UI/Custom/movie_card.dart';
import 'package:movies_app/UI/Screens/Details/movie_details.dart';
import 'package:movies_app/cubit/fav/fav_cubit.dart';
import 'package:movies_app/cubit/fav/fav_state.dart';

class Fav extends StatelessWidget {
  const Fav({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        if (state.favorites.isEmpty) {
          return Center(
              child: ErrorText(
            text: "No Favorites",
          ));
        } else {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              childAspectRatio: 0.7,
            ),
            padding: EdgeInsets.symmetric(vertical: 10.r),
            itemCount: state.favorites.length,
            itemBuilder: (context, index) {
              final movie = state.favorites[index];
              return MovieCard(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => MovieDetails(
                                id: movie["id"],
                              )));
                },
                title: movie["title"] ?? "",
                imageUrl: AppTexts.imageUrl + movie["poster_path"],
              );
            },
          );
        }
      },
    );
  }
}
