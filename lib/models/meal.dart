import 'package:flutter/foundation.dart';

enum Complexity { Simple, Challenging, Hard }

enum Affordability { Affordable, Pricey, Luxurious }

class Meal {
  final String id;

  final String title;
  final String imageUrl;
  final String eatingHabit;
  final String description;
  final bool isBird;
  final bool isNative;
  final bool isHunter;
  const Meal({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.eatingHabit,
    @required this.description,
    @required this.isBird,
    @required this.isHunter,
    @required this.isNative,
  });
}
