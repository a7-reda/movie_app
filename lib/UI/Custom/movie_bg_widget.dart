import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/Resources/app_color.dart';
import 'package:movies_app/UI/Custom/image.dart';

class MovieBg extends StatelessWidget {
  final String imageUrl;
  final VoidCallback? love;
  final VoidCallback? share;
  final Widget? icon;
  const MovieBg({
    super.key,
    required this.imageUrl,
    this.love,
    this.icon,
    this.share,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            height: 250.h,
            width: double.infinity,
            child: ClipRRect(
                child: ImageMovie(
              url: imageUrl,
            )),
          ),
        ),
        Positioned(
          top: 20.h,
          right: 5.w,
          child: Column(
            children: [
              GestureDetector(
                  onTap: share,
                  child: Container(
                      height: 50.h,
                      width: 50.w,
                      margin: EdgeInsets.only(left: 10.r, top: 10.r),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.blue),
                      child: Icon(
                        Icons.share,
                        size: 25.r,
                        color: AppColors.white,
                      ))),
              GestureDetector(
                  onTap: love,
                  child: Container(
                      height: 50.h,
                      width: 50.w,
                      margin: EdgeInsets.only(left: 10.r, top: 10.r),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.blue),
                      child: icon)),
            ],
          ),
        )
      ],
    );
  }
}
