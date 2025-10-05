import 'package:flutter/material.dart';
import 'package:movies_app/UI/Custom/custom_text.dart';

class Loading extends StatelessWidget {
  final Color color;
  Loading({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color,
      ),
    );
  }
}

class LoadingTap extends StatelessWidget {
  final String meassage;
  final VoidCallback onTap;
  const LoadingTap({
    super.key,
    required this.meassage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Center(
          child: ErrorText(
            text: meassage,
          ),
        ),
      ),
    );
  }
}
