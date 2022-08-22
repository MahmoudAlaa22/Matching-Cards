import 'dart:developer';

import 'package:confetti/confetti.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/back_arrow_widget.dart';
import '../../widgets/header_text.dart';
import '../../widgets/outlined_text_widget.dart';
import 'const/full_data_cards.dart';
import 'model/level_model.dart';
import 'state_management/matching_cards_controller_getx.dart';
import 'widgets/back_flip_card.dart';
import 'widgets/front_flip_card.dart';

class MatchingCardsPage extends StatelessWidget {
  MatchingCardsPage({Key? key}) : super(key: key);
  static const String routeName = "/MatchingCardsPage";
  final cardsLogic = Get.put(MatchingCardsControllerGetx());

  @override
  Widget build(BuildContext context) {
    final LevelModel? cardLevel = Get.arguments;
    final listOfFlipCardState = cardLevel!.listOfFlipCardState!;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(110),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Stack(
              children: [
                Center(
                    child: HeaderText(
                  title: '${cardLevel.nameAr}',
                )),
                const BackArrowWidget(),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          GetBuilder<MatchingCardsControllerGetx>(initState: (_) {
            final list = fullDataCards.sublist(0, listOfFlipCardState.length);
            cardsLogic.initState(list);
          }, builder: (logic) {
            final start = logic.time > 0 ? false : true;
            final title = !start
                ? 'الوقت ${logic.time}'
                : logic.left != 0
                    ? 'باقي ${logic.left}'
                    : 'أحسنت 😍 🎉';
            return Column(
              children: [
                OutlinedTextWidget(title: title),
                Expanded(
                  child: GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemCount: listOfFlipCardState.length,
                      itemBuilder: (context, index) {
                        if (start) {
                          return FlipCard(
                            flipOnTouch:
                                logic.wait ? false : logic.cardFlips[index],
                            onFlip: () => logic.onFlip(
                                context: context,
                                index: index,
                                listOfFlipCardState: listOfFlipCardState)
                            // cardsLogic.onFlip(
                            // context: context,
                            // index: index,
                            // listOfFlipCardState: listOfFlipCardState)
                            ,
                            key: listOfFlipCardState[index],
                            front: const FrontFlipCard(),
                            back: BackFlipCard(image: logic.listOfCard[index]),
                          );
                        } else {
                          return BackFlipCard(
                            image: logic.listOfCard[index],
                          );
                        }
                      }),
                ),

                // SingleChildScrollView(
                //   child: GetBuilder<MatchingCardsControllerGetx>(
                //     initState: (_) {
                //       final list =
                //           fullDataCards.sublist(0, listOfFlipCardState.length);
                //       cardsLogic.initState(list);
                //     },
                //     builder: (logic) {
                //       final start = logic.time > 0 ? false : true;
                //       final title =
                //           !start ? 'Time ${logic.time}' : 'Left ${logic.left}';
                //       return Column(
                //         children: [
                //           GridView.builder(
                //               padding: const EdgeInsets.symmetric(horizontal: 10),
                //               shrinkWrap: true,
                //               physics: const NeverScrollableScrollPhysics(),
                //               gridDelegate:
                //                   const SliverGridDelegateWithFixedCrossAxisCount(
                //                 crossAxisCount: 3,
                //               ),
                //               itemCount: listOfFlipCardState.length,
                //               itemBuilder: (context, index) {
                //                 if (start) {
                //                   return FlipCard(
                //                     flipOnTouch:
                //                     logic.wait
                //                         ? false
                //                         : logic.cardFlips[index],
                //                     onFlip: () =>
                //                         logic.onFlip(
                //                       context: context,
                //                       index: index,
                //                       listOfFlipCardState:listOfFlipCardState
                //                     )
                //                         // cardsLogic.onFlip(
                //                         // context: context,
                //                         // index: index,
                //                         // listOfFlipCardState: listOfFlipCardState)
                //                     ,
                //                     key: listOfFlipCardState[index],
                //                     front: const FrontFlipCard(),
                //                     back: BackFlipCard(
                //                         image: logic.listOfCard[index]),
                //                   );
                //                 } else {
                //                   return BackFlipCard(
                //                     image: logic.listOfCard[index],
                //                   );
                //                 }
                //               })
                //         ],
                //       );
                //     },
                //   ),
                // ),
              ],
            );
          }),
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: cardsLogic.controllerCenter!,
              blastDirectionality: BlastDirectionality.explosive,
              // don't specify a direction, blast randomly
              shouldLoop: true,
              // start again as soon as the animation is finished
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple
              ],
              // manually specify the colors to be used
              // createParticlePath:
              //     cardsLogic.drawStar, // define a custom shape/path.
            ),
          )
        ],
      ),
    );
  }
}
