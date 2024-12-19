import 'package:api/models/categoryModel.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel model;
  bool isOdd;

  CategoryItem({required this.model, super.key, required this.isOdd});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: model.color,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25),
            topLeft: Radius.circular(25),
            bottomRight:isOdd? Radius.circular(25):Radius.zero,
            bottomLeft:!isOdd? Radius.circular(25):Radius.zero,
          )),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Expanded(child: Image.asset(model.image)),
            Text(
              model.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
