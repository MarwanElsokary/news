import 'package:flutter/material.dart';

class CategoryModel {
  String id;
  String name;
  Color color;
  String image;

  CategoryModel({
    required this.id,
    required this.name,
    required this.color,
    required this.image,
  });

  static List<CategoryModel> getCategories() {
    return [
      CategoryModel(
          id: "business",
          name: "Business",
          color: Color(0xFFCF7E48),
          image: "assets/images/bussines.png"),
      CategoryModel(
          id: "sports",
          name: "Sports",
          color: Colors.red,
          image: "assets/images/sports.png"),
      CategoryModel(
          id: "politics",
          name: "Politics",
          color: Colors.blue,
          image: "assets/images/Politics.png"),
      CategoryModel(
          id: "science",
          name: "Science",
          color: Color(0xFFF2D352),
          image: "assets/images/science.png"),
      CategoryModel(
          id: "technology",
          name: "Technology",
          color: Color(0xFF4882CF),
          image: "assets/images/environment.png"),
      CategoryModel(
          id: "health",
          name: "Health",
          color: Colors.pink,
          image: "assets/images/health.png"),
    ];
  }
}
