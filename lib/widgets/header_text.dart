
import 'package:flutter/material.dart';
import 'package:outlined_text/outlined_text.dart';

import '../common/const/app_colors.dart';
import '../common/const/const_text.dart';
import '../common/theme/text_style.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({Key? key,  this.fontSize=50, this.title=ConstText.appName}) : super(key: key);
final double fontSize;
final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: OutlinedText(
        text: Text(title,
            style: AppTextStyle.pacificoTextStyle.copyWith(fontSize: fontSize,
                color: AppColors.darkBlueColor
            )),
        strokes: [
          // OutlinedTextStroke(color: AppColors.orangeColor, width: 2),
          OutlinedTextStroke(color: AppColors.blueGrayColor, width: 3),
          OutlinedTextStroke(color: AppColors.darkBlueColor, width: 3),
        ],
      ),
    );
  }
}
