import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/Resources/app_color.dart';

class VoteCont extends StatelessWidget {
  final Widget child;
  const VoteCont({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 50.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.bottomIconColor,
          border: Border.all(
            color: AppColors.white,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.black,
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 2),
            )
          ]),
      child: child,
    );
  }
}
