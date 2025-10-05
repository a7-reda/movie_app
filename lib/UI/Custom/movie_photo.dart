import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/Resources/app_color.dart';
import 'package:movies_app/UI/Custom/custom_text.dart';
import 'package:movies_app/UI/Custom/image.dart';

class MoviePhoto extends StatelessWidget {
  final String urlImage;
  final String date;
  final VoidCallback? onPressed;
  const MoviePhoto({
    super.key,
    required this.urlImage,
    required this.date,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 200.h,
          width: 150.w,
          margin: EdgeInsets.symmetric(vertical: 10.r),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: ImageMovie(
              url: urlImage,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.r),
          child: Text(
            date,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 170.h),
          child: ElevatedButton(
              onPressed: onPressed,
              child: CusText(
                text: "Review",
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r)),
                backgroundColor: AppColors.blue,
              )),
        )
      ],
    );
  }
}
