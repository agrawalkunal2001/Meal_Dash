import 'package:flutter/material.dart';
import 'package:meal_dash/screens/meal_category_screen.dart';

class CategoryItem extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;
  final Color categoryColor;
  final String categoryImage;

  CategoryItem(this.categoryId, this.categoryTitle, this.categoryColor,
      this.categoryImage);

  void selectCategory(BuildContext ctx) {
    // Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
    //   return MealCategoryScreen(categoryId, categoryTitle);
    // }));
    Navigator.of(ctx).pushNamed(MealCategoryScreen.routeName,
        arguments: {"id": categoryId, "title": categoryTitle});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(
          context), // Since context is needed, we need to bind selectCategory as anonymous function.
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              categoryColor.withOpacity(0.6),
              categoryColor /* Colors argument takes a list which specifies the transition or gradient of the color based on begin and end arguments*/
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: <Widget>[
            FittedBox(
              child: Text(
                categoryTitle,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Image.asset(
              categoryImage,
              width: 100,
              height: 65,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
