import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  final Function toggleFavorite;
  final Function isAnimalFavorite;

  MealDetailScreen(this.toggleFavorite, this.isAnimalFavorite);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final animalId = ModalRoute.of(context).settings.arguments as String;
    final selectedAnimal =
        DUMMY_ANIMALS.firstWhere((meal) => meal.id == animalId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedAnimal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedAnimal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(
                        selectedAnimal.description,
                        style: (TextStyle(color: Colors.white)),
                      )),
                  // child: Text(selectedAnimal.ingredients[index])),
                ),
                itemCount: 1,
              ),
            ),
            // buildSectionTitle(context, 'Steps'),
            // buildContainer(
            //   ListView.builder(
            //     itemBuilder: (ctx, index) => Column(
            //       children: [
            //         ListTile(
            //           leading: CircleAvatar(
            //             child: Text('# ${(index + 1)}'),
            //           ),
            //           title: Text(
            //             selectedAnimal.steps[index],
            //           ),
            //         ),
            //         Divider()
            //       ],
            //     ),
            //     itemCount: selectedAnimal.steps.length,
            //   ),
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isAnimalFavorite(animalId) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => toggleFavorite(animalId),
      ),
    );
  }
}
