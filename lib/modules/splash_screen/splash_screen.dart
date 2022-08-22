
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matching_cards/common/assets/images.dart';
import 'package:matching_cards/common/const/app_colors.dart';

import '../../common/theme/text_style.dart';
import '../../common/const/const_text.dart';
import 'state_management/splash_screen_getx.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String routeName = "/SplashScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all( 20),
          child: Center(
            child: GetBuilder<SplashScreenGetx>(
              init: SplashScreenGetx(),
              builder: (_){
                return Column(
                  mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
                  children: [
                    Image.asset(AppImages.cardGame),
                    DefaultTextStyle(
                      style: AppTextStyle.pacificoTextStyle.copyWith(
                        fontSize: 50,color: AppColors.darkBlueColor
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          WavyAnimatedText(ConstText.appName),
                        ],
                        isRepeatingAnimation: true,
                        onTap: () {
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
