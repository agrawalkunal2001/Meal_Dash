import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 17, 15, 17),
      child: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 2.5 / 2 /* Width/height*/,
            crossAxisSpacing: 20,
            mainAxisSpacing:
                20), // Sliver is a scrollable area on the screen. Grid delegate takes care of the structuring of the grid. With max cross axis extent lets us define the max width of each grid item.
        children: categoryData
            .map((item) =>
                CategoryItem(item.id, item.title, item.color, item.image))
            .toList(),
      ),
    );
  }
}
