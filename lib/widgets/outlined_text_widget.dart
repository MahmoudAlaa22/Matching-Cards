import 'package:flutter/material.dart';
import 'package:outlined_text/outlined_text.dart';

import '../common/const/app_colors.dart';
import '../common/theme/text_style.dart';

class OutlinedTextWidget extends StatelessWidget {
  const OutlinedTextWidget(
      {Key? key,
      required this.title,
      this.fontSize = 30.0,
      this.color = Colors.black})
      : super(key: key);
  final String title;
  final double fontSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return OutlinedText(
      text: Text(title,
          style: AppTextStyle.robotoTextStyle!
              .copyWith(color: color, fontSize: fontSize, shadows: [
            const Shadow(
              color: AppColors.darkBlueColor,
              blurRadius: 2,
              offset: Offset(1, 2),
            ),
            const Shadow(
                color: AppColors.blueGrayColor,
                blurRadius: 3,
                offset: Offset(0.5, 2))
          ])),
      // strokes: [
      // OutlinedTextStroke(color: AppColors.blueGrayColor, width: 2),
      // OutlinedTextStroke(color: AppColors.darkBlueColor, width: 3),
      // ],
    );
  }
}
