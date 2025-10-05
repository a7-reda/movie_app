import 'package:flutter/material.dart';

class CusText extends StatelessWidget {
  final String text;
  const CusText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}


class CusTitle extends StatelessWidget {
  final String text;
  const CusTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.labelMedium,
    );
  }
}
class ErrorText extends StatelessWidget {
  final String text;
  const ErrorText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}


