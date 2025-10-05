import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/Resources/app_color.dart';
import 'package:movies_app/Resources/texts.dart';
import 'package:movies_app/UI/Custom/custom_text.dart';
import 'package:movies_app/UI/Custom/image.dart';
import 'package:movies_app/UI/Custom/loading_widget.dart';
import 'package:movies_app/cubit/Network/Reviews/review_cubit.dart';
import 'package:movies_app/cubit/Network/Reviews/review_state.dart';

class Reviews extends StatefulWidget {
  final int movieId;
  const Reviews({super.key, required this.movieId});

  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  @override
  void initState() {
    super.initState();
    context.read<ReviewCubit>().getReviews(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ReviewCubit, ReviewState>(
        builder: (context, state) {
          if (state is ReviewLoading) {
            return Loading(color: AppColors.bottomBarColor);
          } else if (state is ReviewLoaded) {
            if (state.reviews.isEmpty) {
              return Center(
                child: ErrorText(text: "No Reviews"),
              );
            } else {
              return ListView.builder(
                itemCount: state.reviews.length,
                itemBuilder: (context, index) {
                  final review = state.reviews[index];
                  return ListTile(
                    contentPadding: EdgeInsets.all(5.r),
                    titleAlignment: ListTileTitleAlignment.top,
                    leading: SizedBox(
                      height: 40.h,
                      width: 40.w,
                      child: review["author_details"]["avatar_path"] == null
                          ? CircleAvatar(
                              backgroundColor: AppColors.bottomBarColor,
                              child: CusText(text: review["author"][0]),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(50.r),
                              child: ImageMovie(
                                url: AppTexts.imageUrl +
                                    review["author_details"]["avatar_path"],
                              ),
                            ),
                    ),
                    title: CusTitle(
                      text: review["author"],
                    ),
                    subtitle: CusText(text: review["content"]),
                  );
                },
              );
            }
          } else if (state is ReviewError) {
            return LoadingTap(
              meassage: state.message,
              onTap: () =>
                  context.read<ReviewCubit>().getReviews(widget.movieId),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
