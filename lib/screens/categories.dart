import 'package:api/category_item.dart';
import 'package:api/models/categoryModel.dart';
import 'package:flutter/material.dart';

class CategoriesTab extends StatelessWidget {
  Function onClick;

  CategoriesTab({required this.onClick, super.key});

  List<CategoryModel> categories = CategoryModel.getCategories();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text(
              "Pick Your Category of Interest",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    onClick(categories[index]);
                  },
                  child: CategoryItem(
                    model: categories[index],
                    isOdd: index.isOdd,
                  ),
                );
              },
              itemCount: categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
