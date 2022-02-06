import 'package:flutter/material.dart';

enum Complexity {
  Simple, //0
  Challenging, //1
  Difficult //2
}

enum Affordability {
  Affordable, //0
  Costly, //1
  Luxurious //2
}

class Meal {
  final String id;
  final List<String> categories; // A meal can be part of many categories.
  final String title;
  final String imageURL;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal(
      {required this.id,
      required this.categories,
      required this.title,
      required this.imageURL,
      required this.ingredients,
      required this.steps,
      required this.duration,
      required this.complexity,
      required this.affordability,
      required this.isGlutenFree,
      required this.isLactoseFree,
      required this.isVegan,
      required this.isVegetarian});
}
