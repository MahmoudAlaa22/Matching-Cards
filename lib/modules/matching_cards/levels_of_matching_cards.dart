
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/const/app_colors.dart';
import '../../common/const/const_text.dart';
import '../../widgets/animated_button_widget/animated_button_widget.dart';
import '../../widgets/back_arrow_widget.dart';
import '../../widgets/header_text.dart';
import '../../widgets/outlined_text_widget.dart';
import 'const/list_of_matching_cards_level.dart';
import 'matching_cards_page.dart';

class LevelsOfMatchingCardsPage extends GetWidget {
  const LevelsOfMatchingCardsPage({Key? key}) : super(key: key);
  static const String routeName = "/LevelsOfMatchingCardsPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(250),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Stack(
              children: const [
                Center(
                    child: HeaderText(
                  title: ConstText.appName,
                )),
                // BackArrowWidget(),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: listOfMatchingCardsLevel
            .map((e)=>Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: AnimatedButtonWidget(
              width: Get.width * 0.9,
              height: Get.height * 0.12,
              color: e.color!,
              onPressed: () => Get.toNamed(MatchingCardsPage.routeName,arguments: e),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    OutlinedTextWidget(
                      title: '${e.nameAr}',
                      color: AppColors.pewterColor,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: generateStar(e.noOfStar!),
                    )
                  ],
                ),
              )),
        ))
            .toList(),
      ),
    );
  }

  List<Widget> generateStar(int no) {
    List<Widget> icons = [];
    for (int i = 0; i < no; i++) {
      icons.insert(
          i,
          const Icon(
            Icons.star,
            color: Colors.yellow,
          ));
    }
    return icons;
  }
}
