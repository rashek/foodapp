import 'package:flutter/foundation.dart';

enum EatingHabit { Carnivour, Harbivour, Omnivour }

class Animal {
  final String id;
  final String category;
  final String title;
  final String imageUrl;
  final EatingHabit eatingHabit;
  final String description;
  final bool isBird;
  final bool isMammal;
  final bool isReptile;
  final bool isFish;
  final bool isNative;
  final bool isHunter;
  final bool isInsect;
  const Animal({
    @required this.id,
    @required this.category,
    @required this.title,
    @required this.imageUrl,
    @required this.eatingHabit,
    @required this.description,
    @required this.isBird,
    @required this.isMammal,
    @required this.isReptile,
    @required this.isFish,
    @required this.isHunter,
    @required this.isNative,
    @required this.isInsect,
  });
}
