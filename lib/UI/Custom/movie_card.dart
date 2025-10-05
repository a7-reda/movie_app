import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marquee/marquee.dart';
import 'package:movies_app/Resources/app_color.dart';
import 'package:movies_app/UI/Custom/custom_text.dart';
import 'package:movies_app/UI/Custom/image.dart';

class MovieCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final VoidCallback? onTap;
  const MovieCard({
    super.key,
    required this.title,
    required this.imageUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.r),
      splashColor: AppColors.bottomIconColor,
      child: Card(
        color: AppColors.bottomIconColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200.h,
              width: double.infinity,
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r),
                  ),
                  child: ImageMovie(
                    url: imageUrl,
                  )),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.r),
                alignment: Alignment.centerLeft,
                child: title.length > 18
                    ? Marquee(
                        text: title,
                        style: Theme.of(context).textTheme.labelSmall,
                        blankSpace: 50.0,
                        velocity: 30.0,
                        pauseAfterRound: const Duration(seconds: 2),
                      )
                    : CusText(
                        text: title,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
