import 'package:flutter/material.dart';
import 'package:meal_dash/models/meal.dart';
import 'package:meal_dash/widgets/meal_item.dart';

class StarredScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;

  StarredScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Center(
        child: Text("You have no starred meals! Start adding some!!"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favouriteMeals[index].id,
            title: favouriteMeals[index].title,
            imageURL: favouriteMeals[index].imageURL,
            duration: favouriteMeals[index].duration,
            complexity: favouriteMeals[index].complexity,
            affordability: favouriteMeals[index].affordability,
          );
        },
        itemCount: favouriteMeals.length,
      );
    }
  }
}
