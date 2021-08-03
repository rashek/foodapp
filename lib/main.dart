import 'package:flutter/material.dart';
import './dummy_data.dart';

import './screens/tabs_screen.dart';
import 'screens/animal_detail_screen.dart';
import 'screens/category_animals_screen.dart';
import './screens/filters_screen.dart';
import './screens/categories_screen.dart';
import 'models/animal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'bird': false,
    'mammal': false,
    'reptile': false,
    'fish': false,
    'native': false,
    'hunter': false,
    'insect': false,
  };

  List<Animal> _availableAnimals = DUMMY_ANIMALS;
  List<Animal> _favoriteAnimals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableAnimals = DUMMY_ANIMALS.where((animal) {
        if (_filters['bird'] && !animal.isBird) {
          return false;
        }
        if (_filters['mammal'] && !animal.isMammal) {
          return false;
        }
        if (_filters['reptile'] && !animal.isReptile) {
          return false;
        }
        if (_filters['fish'] && !animal.isFish) {
          return false;
        }
        if (_filters['insect'] && !animal.isInsect) {
          return false;
        }

        if (_filters['native'] && !animal.isNative) {
          return false;
        }
        if (_filters['hunter'] && !animal.isHunter) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  bool _isAnimalFavorite(String id) {
    return _favoriteAnimals.any((animal) => animal.id == id);
  }

  void _toggoleFavorite(String animalId) {
    final existingIndex =
        _favoriteAnimals.indexWhere((animal) => animal.id == animalId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteAnimals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteAnimals.add(
          DUMMY_ANIMALS.firstWhere((animal) => animal.id == animalId),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Learning animals',
      theme: ThemeData(
        primaryColor: Color(0xff24d39b),
        accentColor: Color(0xff1c45a4),
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            body2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            title: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),

      initialRoute: '/', // default is '/'
      routes: {
        '/': (ctx) => TabsScreen(_favoriteAnimals),
        CategoryAnimalsScreen.routeName: (ctx) =>
            CategoryAnimalsScreen(_availableAnimals),
        AnimalDetailScreen.routeName: (ctx) =>
            AnimalDetailScreen(_toggoleFavorite, _isAnimalFavorite),
        FiltersScreen.routeName: (ctx) =>
            FiltersScreen(saveFilters: _setFilters, currentFilters: _filters),
      },

      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
    );
  }
}
