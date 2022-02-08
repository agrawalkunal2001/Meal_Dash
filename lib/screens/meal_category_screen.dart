import 'package:flutter/material.dart';
import 'package:meal_dash/data.dart';
import 'package:meal_dash/models/meal.dart';
import 'package:meal_dash/widgets/meal_item.dart';

class MealCategoryScreen extends StatefulWidget {
  static const routeName = "/meal-category";

  @override
  State<MealCategoryScreen> createState() => _MealCategoryScreenState();
}

class _MealCategoryScreenState extends State<MealCategoryScreen> {
  // Converted to stateful widget to add remoce meal function which removes a meal from meal category screen after it is popped.
  String? categoryTitle;
  List<Meal>? categoryMeal;
  bool _loadInit = false;

  @override
  void initState() {
    // This gives an error as routeArgs uses context. In it state runs too early before the build method due to which context is not available.

    // final routeArgs = ModalRoute.of(context)!.settings.arguments
    //     as Map<String, String>; // In CategoryItem, arguments is a map.
    // final categoryId = routeArgs["id"];
    // categoryTitle = routeArgs["title"];
    // categoryMeal = mealData.where((meal) {
    //   return meal.categories.contains(categoryId);
    // }).toList();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // Solution for in it state problem.
    if (!_loadInit) {
      final routeArgs = ModalRoute.of(context)!.settings.arguments
          as Map<String, String>; // In CategoryItem, arguments is a map.
      final categoryId = routeArgs["id"];
      categoryTitle = routeArgs["title"];
      categoryMeal = mealData.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadInit = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      categoryMeal?.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle!),
          actions: <Widget>[
            Container(
              padding: EdgeInsets.all(12),
              child: Text("Meal Dash",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
            )
          ],
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: categoryMeal![index].id,
              title: categoryMeal![index].title,
              imageURL: categoryMeal![index].imageURL,
              duration: categoryMeal![index].duration,
              complexity: categoryMeal![index].complexity,
              affordability: categoryMeal![index].affordability,
              removeItem: _removeMeal,
            );
          },
          itemCount: categoryMeal?.length,
        ));
  }
}
