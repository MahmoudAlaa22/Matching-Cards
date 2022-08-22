import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/const/app_colors.dart';
import 'animated_button_widget/animated_button_widget.dart';

class BackArrowWidget extends StatelessWidget {
  const BackArrowWidget({Key? key, this.color = Colors.white})
      : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: AnimatedButtonWidget(
          height: 50,
          width: 50,
          color: color,
          onPressed: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.orangeColor,
          )),
    );
  }
}
