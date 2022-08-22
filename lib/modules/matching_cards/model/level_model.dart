import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

enum Level { hard, medium, easy }
class LevelModel{
  final Level? level;
  final String? nameAr;
  final int? noOfStar;
  final Color? color;
  final List<GlobalKey<FlipCardState>>? listOfFlipCardState;

  LevelModel({this.nameAr,this.level, this.noOfStar, this.color,this.listOfFlipCardState,});
}