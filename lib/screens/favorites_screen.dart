import 'package:flutter/material.dart';

import '../models/animal.dart';
import '../widgets/animal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Animal> favoriteAnimals;

  FavoritesScreen(this.favoriteAnimals);

  @override
  Widget build(BuildContext context) {
    if (favoriteAnimals.isEmpty) {
      return Center(
        child: Text('The Favorites'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return AnimalItem(
            id: favoriteAnimals[index].id,
            category: favoriteAnimals[index].category,
            title: favoriteAnimals[index].title,
            imageUrl: favoriteAnimals[index].imageUrl,
            eatingHabit: favoriteAnimals[index].eatingHabit,
          );
        },
        itemCount: favoriteAnimals.length,
      );
    }
  }
}
