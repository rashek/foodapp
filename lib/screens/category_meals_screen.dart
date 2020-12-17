import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '//category-meals-screen';

  // final String categoryId;
  // final String categoryTitle;
  // final Color categoryColor;

  // CategoryMealsScreen(this.categoryId, this.categoryTitle, this.categoryColor);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    final categoryColor = routeArgs['color'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    // final categoryColor = routeArgs['color'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: categoryColor,
        title: Text(categoryTitle),
      ),
      body: Container(
        height: 500,
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                id: categoryMeals[index].id,
                title: categoryMeals[index].title,
                imageUrl: categoryMeals[index].imageUrl,
                duration: categoryMeals[index].duration,
                complexity: categoryMeals[index].complexity,
                affordability: categoryMeals[index].affordability);
          },
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}
