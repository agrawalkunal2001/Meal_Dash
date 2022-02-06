import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: Center(
        child: Text("Hello"),
      ),
    );
  }
}
