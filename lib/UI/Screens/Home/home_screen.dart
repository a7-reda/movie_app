import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/Resources/app_color.dart';
import 'package:movies_app/Resources/texts.dart';
import 'package:movies_app/UI/Screens/Home/fav.dart';
import 'package:movies_app/UI/Screens/Home/top_rated.dart';
import 'package:movies_app/UI/Screens/Home/most_popular.dart';
import 'package:movies_app/cubit/navigation/nav_cubit.dart';
import 'package:movies_app/cubit/navigation/nav_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List title = [
    AppTexts.popular,
    AppTexts.topRated,
    AppTexts.favorites,
  ];

  List<Widget> pages = [
    MostPopular(),
    TopRated(),
    Fav(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NavCubit(),
        child: BlocBuilder<NavCubit, NavState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(title: Text(title[state.index])),
            
              body: pages[state.index],
              bottomNavigationBar: CurvedNavigationBar(
                color: AppColors.bottomBarColor,
                backgroundColor: AppColors.backColor,
                buttonBackgroundColor: AppColors.bottomIconColor,
                items: <Widget>[
                  Icon(
                    Icons.whatshot,
                    size: 30.r,
                    color: AppColors.white,
                  ),
                  Icon(
                    Icons.hotel_class,
                    size: 30.r,
                    color: AppColors.white,
                  ),
                  Icon(
                    Icons.favorite,
                    size: 30.r,
                    color: AppColors.white,
                  ),
                ],
                onTap: (index) {
                  context.read<NavCubit>().changeTab(index);
                },
              ),
            );
          },
        ));
  }
}
