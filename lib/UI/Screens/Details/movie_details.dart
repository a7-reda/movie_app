import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/Resources/app_color.dart';
import 'package:movies_app/Resources/texts.dart';
import 'package:movies_app/UI/Custom/actor_con.dart';
import 'package:movies_app/UI/Custom/custom_text.dart';
import 'package:movies_app/UI/Custom/listForVideos.dart';
import 'package:movies_app/UI/Custom/loading_widget.dart';
import 'package:movies_app/UI/Custom/movie_bg_widget.dart';
import 'package:movies_app/UI/Custom/movie_photo.dart';
import 'package:movies_app/UI/Custom/vote_container.dart';
import 'package:movies_app/UI/Screens/Details/reviews.dart';
import 'package:movies_app/cubit/Network/Actors/actor_cubit.dart';
import 'package:movies_app/cubit/Network/Actors/actor_state.dart';
import 'package:movies_app/cubit/Network/Details/get_movie_details_cubit.dart';
import 'package:movies_app/cubit/Network/Details/get_movie_details_state.dart';
import 'package:movies_app/cubit/Network/Videos/video_cubit.dart';
import 'package:movies_app/cubit/Network/Videos/video_state.dart';
import 'package:movies_app/cubit/fav/fav_cubit.dart';
import 'package:movies_app/cubit/fav/fav_state.dart';
import 'package:movies_app/cubit/Network/Videos/open_video.dart';
import 'package:movies_app/cubit/functions/name_fun.dart';
import 'package:share_plus/share_plus.dart';

class MovieDetails extends StatefulWidget {
  final int id;
  const MovieDetails({super.key, required this.id});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  void initState() {
    super.initState();
    context.read<DetailsCubit>().getDetails(widget.id);
    context.read<FavoritesCubit>().checkIfFavorite(widget.id);
    context.read<VideoCubit>().getVideos(widget.id);
    context.read<ActorCubit>().getCast(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DetailsCubit, MovieDetailsState>(
          builder: (context, state) {
        if (state is MovieLoading) {
          return Loading(
            color: AppColors.bottomBarColor,
          );
        } else if (state is MovieLoaded) {
          return Column(
            children: [
              MovieBg(
                imageUrl: AppTexts.imageUrl + state.details["backdrop_path"],
                love: () {
                  context.read<FavoritesCubit>().toggleFavorite(state.details);
                },
                icon: BlocBuilder<FavoritesCubit, FavoritesState>(
                  builder: (context, fav) {
                    return Icon(
                      Icons.favorite,
                      size: 25.r,
                      color: fav.isFavorite
                          ? AppColors.bottomIconColor
                          : AppColors.white,
                    );
                  },
                ),
                share: () {
                  final movieTitle = state.details["title"];
                  final movieOverview = state.details["overview"];
                  final movieUrl = "${AppTexts.movieUrl}${state.details["id"]}";

                  Share.share(
                    "$movieTitle\n\n$movieOverview\n\nWatch more: $movieUrl",
                    subject: "Check out this movie!",
                  );
                },
              ),
              Expanded(
                child: Container(
                  child: ListView(
                    padding: EdgeInsets.all(10.r),
                    children: [
                      CusTitle(
                        text: state.details["title"],
                      ),
                      MoviePhoto(
                        urlImage:
                            AppTexts.imageUrl + state.details["poster_path"],
                        date: state.details["release_date"],
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => Reviews(
                                        movieId: widget.id,
                                      )));
                        },
                      ),
                      Divider(
                        color: AppColors.grey,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(children: [
                              VoteCont(
                                child: CusText(
                                  text: state.details["vote_average"]
                                      .toStringAsFixed(1),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              CusText(text: "Rating")
                            ]),
                            Column(children: [
                              VoteCont(
                                child: CusText(
                                  text: state.details["popularity"]
                                      .toStringAsFixed(0),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              CusText(text: "Popularity")
                            ]),
                            Column(children: [
                              VoteCont(
                                child: CusText(
                                  text: state.details["original_language"],
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "Lunguage",
                                style: Theme.of(context).textTheme.bodySmall,
                              )
                            ])
                          ]),
                      SizedBox(
                        height: 10.h,
                      ),
                      Divider(
                        color: AppColors.grey,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.r),
                        child: CusTitle(
                          text: "Overview",
                        ),
                      ),
                      CusText(
                        text: state.details["overview"],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Divider(
                        color: AppColors.grey,
                      ),
                      BlocBuilder<ActorCubit, ActorState>(
                        builder: (context, state) {
                          if (state is ActorLoading) {
                            return Loading(color: AppColors.bottomBarColor);
                          } else if (state is ActorLoaded) {
                            return Container(
                              height: 100.h,
                              padding: EdgeInsets.symmetric(vertical: 8.r),
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: state.actorsList.length,
                                  itemBuilder: (context, index) {
                                    final actor = state.actorsList[index];
                                    return ActorCon(
                                      name: formatActorName(actor["name"]),
                                      profile: actor["profile_path"],
                                    );
                                  }),
                            );
                          } else {
                            return Center(
                              child: CusText(
                                text: "No Actors",
                              ),
                            );
                          }
                        },
                      ),
                      Divider(
                        color: AppColors.grey,
                      ),
                      BlocBuilder<VideoCubit, VideoState>(
                        builder: (context, state) {
                          if (state is VideoLoading) {
                            return Loading(color: AppColors.bottomBarColor);
                          } else if (state is VideoLoaded) {
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: state.videos.length,
                              itemBuilder: (context, index) {
                                final video = state.videos[index];
                                final videoKey = video["key"];
                                return VideoCon(
                                    videoKey: videoKey,
                                    title: video["name"],
                                    onTap: () async {
                                      await openVideo(videoKey);
                                    });
                              },
                            );
                          } else {
                            return Center(
                              child: CusText(
                                text: "No Videos",
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        } else if (state is MovieError) {
          return LoadingTap(
            meassage: state.message,
            onTap: () {
              context.read<DetailsCubit>().getDetails(widget.id);
              context.read<FavoritesCubit>().checkIfFavorite(widget.id);
              context.read<VideoCubit>().getVideos(widget.id);
              context.read<ActorCubit>().getCast(widget.id);
            },
          );
        } else {
          return Loading(
            color: AppColors.bottomBarColor,
          );
        }
      }),
    );
  }
}
