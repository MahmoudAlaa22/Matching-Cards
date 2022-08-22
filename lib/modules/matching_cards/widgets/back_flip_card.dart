import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/const/app_colors.dart';
import '../state_management/matching_cards_controller_getx.dart';

class BackFlipCard extends StatelessWidget {
   const BackFlipCard({Key? key, required this.image}) : super(key: key);
  // final int index;
  // final matchingCardsControllerGetx = Get.find<MatchingCardsControllerGetx>();
final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          color: Colors.grey[100],
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
          ],
          borderRadius: BorderRadius.circular(5)),
      margin: const EdgeInsets.all(4.0),
      child: Image.asset(image),
    );
  }
}
