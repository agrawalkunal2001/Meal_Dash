import 'package:flutter/material.dart';

class Category {
  // Blueprint or model of a transaction
  final String? id;
  final String? title;
  final Color? color;
  final Image? image;

  const Category(
      {required this.id,
      required this.title,
      required this.color,
      required this.image});
}
