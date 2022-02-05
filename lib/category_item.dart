import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String categoryTitle;
  final Color categoryColor;
  final String categoryImage;

  CategoryItem(this.categoryTitle, this.categoryColor, this.categoryImage);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            height: 80,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
