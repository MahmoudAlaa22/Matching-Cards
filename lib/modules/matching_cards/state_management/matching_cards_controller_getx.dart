import 'dart:async';
import 'dart:developer';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:confetti/confetti.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/controller/error_controller/error_controller_getx.dart';

class MatchingCardsControllerGetx extends GetxController {
  Rx<Timer>? timer;

  // RxInt time = 5.obs;
  int time = 5;

  // RxInt left = 0.obs;
  int left = 0;
  RxList listOfCard = [].obs;
  RxList listOfCardIndex = [].obs;
  RxList<bool> cardFlips = <bool>[].obs;

  // RxBool flip = false.obs;
  bool flip = false;

  // RxBool wait = false.obs;
  bool wait = false;

  // RxInt previousIndex = 0.obs;
  int previousIndex = 0;
  ConfettiController? controllerCenter;

// RxBool isFinished = false.obs;
  @override
  void onInit() {
    super.onInit();
    controllerCenter = ConfettiController(duration: const Duration(seconds: 5));
  }

  @override
  void dispose() {
    controllerCenter!.dispose();
    super.dispose();
  }

  // Future<void> onFlip(
  //     {required int index,
  //     required List<GlobalKey<FlipCardState>> listOfFlipCardState}) async {
  //   ///
  // }

  Future<void> onFlip(
      {required BuildContext context,
      required int index,
      required List<GlobalKey<FlipCardState>> listOfFlipCardState}) async {
    log('onFlip');
    if (!flip) {
      log('in if 1 ');
      // changeFlip(true);
      flip = true;
      // changePreviousIndex(index);
      previousIndex = index;
    } else {
      log('in if 2 ');
      // changeFlip(false);
      flip = false;
      if (previousIndex != index) {
        log('in if 3 ');
        if (listOfCard[previousIndex] != listOfCard[index]) {
          log('in if 4 ');
          // changeWait(true);
          wait = true;
          Future.delayed(const Duration(milliseconds: 1500), () {
            log('in if 5 ');
            listOfFlipCardState[previousIndex].currentState!.toggleCard();
            previousIndex=index;

            listOfFlipCardState[previousIndex].currentState!.toggleCard();
            log('in if 6 ');
            wait = false;
            update();
          });
        } else {
          log('in if 7 ');
          cardFlips[previousIndex] = false;
          cardFlips[index] = false;
          countDownLeft();
          if (cardFlips.every((t) => t == false)) {
            log('in if 8 ');
            await whenFinished(context);
          }
        }
      }
    }
    update();
  }

  void initState(List list) {
    listOfCard([...list]).shuffle();
    cardFlips(List<bool>.generate(list.length, (index) => true));
    startTimer();
    changePreviousIndex(-1);
    left = list.length ~/ 2;
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (time > 0) {
        time--;
        update();
      } else {
        stopTimer();
      }
    }).obs;
  }

  Future<void> stopTimer() async {
    await Future.delayed(Duration.zero);
    timer!.value.cancel();
  }

  // void changeFlip(bool b) => flip(b);
  //
  // void changeWait(bool b) => wait(b);

  Future<void> whenFinished(BuildContext context) async{
    final snackBarControllerGetx = Get.find<SnackBarControllerGetx>();
    snackBarControllerGetx.showSnackBarState(
        title: 'أحسنت 😍 🎉',
        message: 'لقد انتهيت من هذا المستوي 🦾',
        contentType: ContentType.success,
        context: context);
    controllerCenter!.play();
    await Future.delayed(const Duration(seconds: 3));
    Get.back();
  }

  // void changePreviousIndex(int index) => previousIndex(index);
  void changePreviousIndex(int index) {
    previousIndex = index;
    update();
  }

  // void countDownLeft() => left--;
  void countDownLeft() {
    left--;
    update();
  }

// /// A custom Path to paint stars.
// Path drawStar(Size size) {
//   // Method to convert degree to radians
//   double degToRad(double deg) => deg * (pi / 180.0);
//
//   const numberOfPoints = 5;
//   final halfWidth = size.width / 2;
//   final externalRadius = halfWidth;
//   final internalRadius = halfWidth / 2.5;
//   final degreesPerStep = degToRad(360 / numberOfPoints);
//   final halfDegreesPerStep = degreesPerStep / 2;
//   final path = Path();
//   final fullAngle = degToRad(360);
//   path.moveTo(size.width, halfWidth);
//
//   for (double step = 0; step < fullAngle; step += degreesPerStep) {
//     path.lineTo(halfWidth + externalRadius * cos(step),
//         halfWidth + externalRadius * sin(step));
//     path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
//         halfWidth + internalRadius * sin(step + halfDegreesPerStep));
//   }
//   path.close();
//   return path;
// }
}
