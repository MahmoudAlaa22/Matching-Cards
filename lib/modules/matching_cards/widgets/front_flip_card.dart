import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/assets/images.dart';
import '../../../common/const/app_colors.dart';

class FrontFlipCard extends StatelessWidget {
  const FrontFlipCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.pewterColor,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              color: AppColors.blueGrayColor,
              blurRadius: 3,
              offset: Offset(2, 1),
            ),
            BoxShadow(
              color: AppColors.lightBlueColor,
              blurRadius: 3,
              offset: Offset(2, 1),
            ),
          ]),
      margin: const EdgeInsets.all(4.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(
          AppImages.quest,
          color: AppColors.darkBlueColor,
        ),
      ),
    );
  }
}
