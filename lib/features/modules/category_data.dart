import 'package:flutter/material.dart';

class CategoryData {
  final String id;
  final String icon;
  final String name;
  final Color categoryColor;

  CategoryData(
      {required this.id,
      required this.name,
      required this.icon,
      required this.categoryColor});
}
