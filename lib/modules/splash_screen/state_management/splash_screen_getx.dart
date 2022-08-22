
import 'package:get/get.dart';
import 'package:matching_cards/modules/matching_cards/levels_of_matching_cards.dart';


class SplashScreenGetx extends GetxController{

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 5),(){
      return Get.offNamed(LevelsOfMatchingCardsPage.routeName);
    });
  }
}