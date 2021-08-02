import 'package:flutter/material.dart';
// import 'package:flutter_complete_guide/screens/categories_screen.dart';

import '../widgets/animal_item.dart';
// import '../dummy_data.dart';
import '../models/animal.dart';

class CategoryAnimalsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Animal> availableAnimals;

  CategoryAnimalsScreen(this.availableAnimals);

  @override
  _CategoryAnimalsScreenState createState() => _CategoryAnimalsScreenState();
}

class _CategoryAnimalsScreenState extends State<CategoryAnimalsScreen> {
  String categoryTitle;
  List<Animal> displayedAnimals;
  var _loadedInitData = false;

  @override
  void initState() {
    // ...
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedAnimals = widget.availableAnimals.where((animal) {
        return animal.category.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeAnimal(String animalId) {
    setState(() {
      displayedAnimals.removeWhere((animal) => animal.id == animalId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return AnimalItem(
            id: displayedAnimals[index].id,
            category: displayedAnimals[index].category,
            title: displayedAnimals[index].title,
            imageUrl: displayedAnimals[index].imageUrl,
            eatingHabit: displayedAnimals[index].eatingHabit,
          );
        },
        itemCount: displayedAnimals.length,
      ),
    );
  }
}
