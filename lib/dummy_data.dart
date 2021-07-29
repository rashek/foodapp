import 'package:flutter/material.dart';

import './models/category.dart';
import './models/meal.dart';

var dummyData = [
  Category(
    id: 'a',
    title: 'Amber',
    color: Colors.amber,
  ),
  Category(
    id: 'b',
    title: 'Blue',
    color: Colors.blue,
  ),
  Category(
    id: 'c',
    title: 'Cyan',
    color: Colors.cyan,
  ),
  Category(
    id: 'd',
    title: 'Denim',
    color: Color(0xFF1560BD),
  ),
  Category(
    id: 'e',
    title: 'Eclipse',
    color: Color(0xFF220F46),
  ),
  Category(
    id: 'f',
    title: 'Flax',
    color: Color(0xFFEEDC82),
  ),
  Category(
    id: 'g',
    title: 'Gold',
    color: Color(0xFFD4AF37),
  ),
  Category(
    id: 'h',
    title: 'Hazel',
    color: Color(0xffa52a2a),
  ),
  Category(
    id: 'i',
    title: 'Indigo',
    color: Color(0xff00416A),
  ),
  Category(
    id: 'j',
    title: 'Jade',
    color: Color(0xFF00A86B),
  ),
  Category(
    id: 'k',
    title: 'Khaki',
    color: Color(0xFFC3B091),
  ),
  Category(
    id: 'l',
    title: 'Lemon',
    color: Color(0xFFFDE910),
  ),
  Category(
    id: 'm',
    title: 'Maroon',
    color: Color(0xFF800000),
  ),
  Category(
    id: 'n',
    title: 'Navy Blue',
    color: Color(0xFF000080),
  ),
  Category(
    id: 'o',
    title: 'Orange',
    color: Colors.orange,
  ),
  Category(
    id: 'p',
    title: 'Pink',
    color: Colors.pink,
  ),
  Category(
    id: 'q',
    title: 'Quartile',
    color: Color(0xFF4CBB17),
  ),
  Category(
    id: 'r',
    title: 'Red',
    color: Colors.red,
  ),
  Category(
    id: 's',
    title: 'Saffron',
    color: Color(0xFFF4C430),
  ),
  Category(
    id: 't',
    title: 'Teal',
    color: Colors.teal,
  ),
  Category(
    id: 'u',
    title: 'Ultra Violet',
    color: Color(0xFF4b019c),
  ),
  Category(
    id: 'v',
    title: 'Violet',
    color: Color(0xFF8B00FF),
  ),
  Category(
    id: 'w',
    title: 'White',
    color: Colors.white,
  ),
  Category(
    id: 'x',
    title: 'Xanadu',
    color: Color(0xFF738678),
  ),
  Category(
    id: 'y',
    title: 'Yellow',
    color: Colors.yellow,
  ),
  Category(
    id: 'z',
    title: 'Zoboba',
    color: Color(0xFFbc8a52),
  ),
];

const DUMMY_MEALS = const [
  const Meal(
    id: 'm1',
    categories: [
      'c1',
      'c2',
    ],
    title: 'Spaghetti with Tomato Sauce',
    affordability: Affordability.Affordable,
    complexity: Complexity.Simple,
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
    duration: 20,
    ingredients: [
      '4 Tomatoes',
      '1 Tablespoon of Olive Oil',
      '1 Onion',
      '250g Spaghetti',
      'Spices',
      'Cheese (optional)'
    ],
    steps: [
      'Cut the tomatoes and the onion into small pieces.',
      'Boil some water - add salt to it once it boils.',
      'Put the spaghetti into the boiling water - they should be done in about 10 to 12 minutes.',
      'In the meantime, heaten up some olive oil and add the cut onion.',
      'After 2 minutes, add the tomato pieces, salt, pepper and your other spices.',
      'The sauce will be done once the spaghetti are.',
      'Feel free to add some cheese on top of the finished dish.'
    ],
    isGlutenFree: false,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
];
