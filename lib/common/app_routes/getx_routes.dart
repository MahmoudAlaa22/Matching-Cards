import 'package:get/get.dart';
import '../../modules/matching_cards/levels_of_matching_cards.dart';
import '../../modules/matching_cards/matching_cards_page.dart';
import '../../modules/splash_screen/splash_screen.dart';


class AppPages {
  ///uncomment this row to make initial splash_screen when app start
  static const initial = SplashScreen.routeName;
  // static const initial = TestPage.routeName;

  static final routes = [
    ///This row to make route to any page.
    GetPage(
      name: SplashScreen.routeName,
      page: () =>  const SplashScreen(),
    ),
    GetPage(
      name: LevelsOfMatchingCardsPage.routeName,
      page: () =>  const LevelsOfMatchingCardsPage(),
    ),
    GetPage(
      name: MatchingCardsPage.routeName,
      page: () =>  MatchingCardsPage(),
    ),
  ];
}
