import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import '../model/level_model.dart';

List<LevelModel> listOfMatchingCardsLevel = [
  LevelModel(
      level: Level.easy,
      nameAr: 'سهل',
      color: Colors.green,
      noOfStar: 1,
      listOfFlipCardState:
          List.generate(6, (index) => GlobalKey<FlipCardState>())),
  LevelModel(
      level: Level.medium,
      nameAr: 'متوسط',
      color: Colors.orange,
      noOfStar: 2,
      listOfFlipCardState:
          List.generate(12, (index) => GlobalKey<FlipCardState>())),
  LevelModel(
      level: Level.hard,
      nameAr: 'صعب',
      color: Colors.red,
      noOfStar: 3,
      listOfFlipCardState:
          List.generate(18, (index) => GlobalKey<FlipCardState>())),
];
