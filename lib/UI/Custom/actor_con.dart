import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/Resources/app_color.dart';
import 'package:movies_app/Resources/texts.dart';
import 'package:movies_app/UI/Custom/custom_text.dart';
import 'package:movies_app/UI/Custom/image.dart';

class ActorCon extends StatelessWidget {
  final String name;
  final String? profile;
  const ActorCon({super.key, required this.name, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.r),
      child: Column(
        children: [
          SizedBox(
            height: 60.h,
            width: 60.w,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: profile == null
                    ? Container(
                        height: 60.h,
                        width: 60.w,
                        color: AppColors.grey,
                        child: Icon(
                          Icons.person,
                          size: 40.w,
                          color: AppColors.white,
                        ),
                      )
                    : ImageMovie(
                        url: AppTexts.imageUrl + profile!,
                      )),
          ),
          SizedBox(
            height: 5.h,
          ),
          CusText(
            text: name,
          )
        ],
      ),
    );
  }
}
