import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/Resources/app_color.dart';
import 'package:movies_app/UI/Screens/Home/home_screen.dart';
import 'package:movies_app/cubit/Network/Actors/actor_cubit.dart';
import 'package:movies_app/cubit/Network/Details/get_movie_details_cubit.dart';
import 'package:movies_app/cubit/Network/Movies/get_movies_cubit.dart';
import 'package:movies_app/cubit/Network/Reviews/review_cubit.dart';
import 'package:movies_app/cubit/Network/Videos/video_cubit.dart';
import 'package:movies_app/cubit/fav/fav_cubit.dart';

void main() {
  runApp(ScreenUtilInit(
    designSize: const Size(375, 812),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) {
      return const MyApp();
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MoviesCubit()),
        BlocProvider(create: (context) => DetailsCubit()),
        BlocProvider(create: (context) => VideoCubit()),
        BlocProvider(create: (context) => FavoritesCubit()),
        BlocProvider(
          create: (context) => ReviewCubit(),
        ),
        BlocProvider(
          create: (context) => ActorCubit(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.backColor,
            textTheme: TextTheme(
              labelMedium: TextStyle(
                color: AppColors.blue,
                fontSize: 17.sp,
                fontWeight: FontWeight.bold,
              ),
              labelSmall: TextStyle(
                color: AppColors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
              bodySmall: TextStyle(
                color: AppColors.white,
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
              ),
              bodyMedium: TextStyle(
                  color: AppColors.white,
                  fontSize: 19.sp,
                  fontWeight: FontWeight.bold),
            ),
            appBarTheme: AppBarTheme(
              backgroundColor: AppColors.bottomBarColor,
              titleTextStyle: TextStyle(
                  color: AppColors.white,
                  fontSize: 19.sp,
                  fontWeight: FontWeight.bold),
              centerTitle: true,
            ),
          ),
          home: HomePage()),
    );
  }
}
