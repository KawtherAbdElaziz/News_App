import 'package:flutter/material.dart';
import 'package:news_app/features/modules/category_data.dart';

class CategoryItemWidget extends StatelessWidget {
  final CategoryData categoryData;
  final void Function(CategoryData) onCategoryClicked;
  final int index;

  const CategoryItemWidget(
      {super.key,
      required this.categoryData,
      required this.onCategoryClicked,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onCategoryClicked(categoryData);
      },
      child: Container(
        padding: const EdgeInsets.only(top: 5),
        width: 138,
        height: 161,
        decoration: BoxDecoration(
            color: categoryData.categoryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: index % 2 == 0
                  ? const Radius.circular(25)
                  : const Radius.circular(0),
              bottomRight: index % 2 != 0
                  ? const Radius.circular(25)
                  : const Radius.circular(0),
              topLeft: const Radius.circular(25),
              topRight: const Radius.circular(25),
            )),
        child: Column(
          children: [
            Expanded(child: Image.asset(categoryData.icon)),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                categoryData.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
