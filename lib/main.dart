import 'dart:ui';

import 'package:flutter/material.dart';
import 'screens/tab_screen_bottom.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/category_meals_screen.dart';

// import 'screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'DeliMeals',
        theme: ThemeData(
            primarySwatch: Colors.pink,
            accentColor: Colors.amber,
            canvasColor: Color.fromRGBO(255, 254, 229, 1),
            fontFamily: 'Raleway',
            textTheme: ThemeData.light().textTheme.copyWith(
                // ignore: deprecated_member_use
                body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                // ignore: deprecated_member_use
                body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                // ignore: deprecated_member_use
                title: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoCondensed',
                ))),
        home: TabScreenBottom(),
        routes: {
          CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
          MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        });
  }
}
