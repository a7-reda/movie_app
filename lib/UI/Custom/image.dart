import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/Resources/app_color.dart';
import 'package:movies_app/UI/Custom/loading_widget.dart';

class ImageMovie extends StatelessWidget {
  final String url;
  const ImageMovie({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => Loading(
        color: AppColors.backColor,
      ),
      errorWidget: (context, url, error) => Icon(
        Icons.error,
        size: 50.w,
        color: AppColors.white,
      ),
      fit: BoxFit.fill,
    );
  }
}
