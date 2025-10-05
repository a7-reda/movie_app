import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marquee/marquee.dart';
import 'package:movies_app/Resources/app_color.dart';
import 'package:movies_app/Resources/texts.dart';
import 'package:movies_app/UI/Custom/custom_text.dart';
import 'package:movies_app/UI/Custom/image.dart';

class VideoCon extends StatelessWidget {
  final String videoKey;
  final String title;
  final VoidCallback onTap;
  const VideoCon({
    super.key,
    required this.videoKey,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: AppColors.bottomIconColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
              child:
                  ImageMovie(url: "${AppTexts.videoPosterUrl}$videoKey/0.jpg"),
            ),
            title.length > 56
                ? Container(
                    height: 30.h,
                    padding: EdgeInsets.symmetric(horizontal: 10.r),
                    child: Marquee(
                      text: title,
                      style: Theme.of(context).textTheme.bodySmall,
                      scrollAxis: Axis.horizontal,
                      blankSpace: 50.0,
                      velocity: 30.0,
                      pauseAfterRound: const Duration(seconds: 2),
                    ),
                  )
                : Container(
                    height: 30.h,
                    padding: EdgeInsets.symmetric(horizontal: 10.r),
                    alignment: Alignment.centerLeft,
                    child: CusText(
                      text: title,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
