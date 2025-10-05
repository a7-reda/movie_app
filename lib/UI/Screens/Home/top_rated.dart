import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/Resources/app_color.dart';
import 'package:movies_app/Resources/texts.dart';
import 'package:movies_app/UI/Custom/loading_widget.dart';
import 'package:movies_app/UI/Custom/movie_card.dart';
import 'package:movies_app/UI/Screens/Details/movie_details.dart';
import 'package:movies_app/cubit/Network/Movies/get_movies_cubit.dart';
import 'package:movies_app/cubit/Network/Movies/get_movies_state.dart';

class TopRated extends StatefulWidget {
  const TopRated({super.key});

  @override
  State<TopRated> createState() => _TopRatedState();
}

class _TopRatedState extends State<TopRated> {
  @override
  void initState() {
    super.initState();
    context.read<MoviesCubit>().getTopRatedMovies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesState>(
      builder: (context, state) {
        if (state is MoviesLoading) {
          return Loading(
            color: AppColors.bottomBarColor,
          );
        } else if (state is MoviesLoaded) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              childAspectRatio: 0.7,
            ),
            padding: EdgeInsets.symmetric(vertical: 10.r),
            itemCount: state.movies.length,
            itemBuilder: (context, index) {
              final movie = state.movies[index];
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
        } else if (state is MoviesError) {
          return LoadingTap(
            meassage: state.error,
            onTap: () => context.read<MoviesCubit>().getTopRatedMovies(),
          );
        } else {
          return Loading(
            color: AppColors.bottomBarColor,
          );
        }
      },
    );
  }
}
