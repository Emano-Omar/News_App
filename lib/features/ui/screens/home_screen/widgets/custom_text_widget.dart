import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String? text;
  final TextStyle? style;
  final int? maxLines;
  final TextOverflow overflow;

  const CustomTextWidget({
    super.key,
    required this.text,
    this.style,
    this.maxLines,
    this.overflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    final displayText = text == null || text!.trim().isEmpty ? '---' : text!;

    return Text(
      displayText,
      style: style ?? Theme.of(context).textTheme.bodyMedium,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
