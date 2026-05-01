import 'package:ecommerce_app/core/constants/app_strings.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/category_item.dart';
import 'package:flutter/material.dart';

class BuildListCategories extends StatelessWidget {
  const BuildListCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.horizontal,
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: AppStrings.categories.length,
      itemBuilder: (context, index) =>
          CategoryItem(title: AppStrings.categories[index]),
    );
  }
}
