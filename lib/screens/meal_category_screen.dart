import 'package:flutter/material.dart';
import 'package:meal_dash/data.dart';
import 'package:meal_dash/widgets/meal_item.dart';

class MealCategoryScreen extends StatelessWidget {
  static const routeName = "/meal-category";
  // final String categoryId;
  // final String categoryTitle;

  // MealCategoryScreen(this.categoryId, this.categoryTitle); // For Navigator.push()

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments
        as Map<String, String>; // In CategoryItem, arguments is a map.
    final categoryId = routeArgs["id"];
    final categoryTitle = routeArgs["title"];
    final categoryMeal = mealData.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle!),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: categoryMeal[index].id,
              title: categoryMeal[index].title,
              imageURL: categoryMeal[index].imageURL,
              duration: categoryMeal[index].duration,
              complexity: categoryMeal[index].complexity,
              affordability: categoryMeal[index].affordability,
            );
          },
          itemCount: categoryMeal.length,
        ));
  }
}
