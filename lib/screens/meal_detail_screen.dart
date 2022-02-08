import 'package:flutter/material.dart';
import 'package:meal_dash/data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/meal-detail";

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = mealData.firstWhere((meal) {
      return meal.id == mealId;
    });

    Widget buildContainer(Widget child) {
      return Container(
          height: 150,
          width: 350,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(15),
          ),
          child: child);
    }

    return Scaffold(
      appBar: AppBar(
          title: Text(
        selectedMeal.title,
      )),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(12),
              height: 300,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  selectedMeal.imageURL,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              child: Text("Ingredients",
                  style: Theme.of(context).textTheme.headline6),
            ),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Text(selectedMeal.ingredients[index])));
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            Container(
              child:
                  Text("Steps", style: Theme.of(context).textTheme.headline6),
            ),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          child: Text("# ${index + 1}"),
                        ),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      Divider(
                        thickness: 2,
                      ),
                    ],
                  );
                },
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context)
              .pop(); // Removes the meal detail screen and goes back to meal item screen.
        },
      ),
    );
  }
}
