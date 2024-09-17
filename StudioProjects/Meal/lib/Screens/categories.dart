import 'package:flutter/material.dart';
import 'package:meal/Model/CategoriesModel.dart';
import 'package:meal/Model/MealModel.dart';
import 'package:meal/Screens/meals.dart';
import 'package:meal/widgets/category_grid_item.dart';

import '../data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
   CategoriesScreen({super.key, required this.onToggleFavourite, required this.availableMeals});

  final void Function(MealModel mealModel) onToggleFavourite;
  final List<MealModel> availableMeals;

  void _selectCategory(BuildContext context, CategoryModel category) {
    final filterMeals = dummyMeal
        .where((element) => element.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MealsScreen(
          title: category.title,
          meals: filterMeals,
          onToggleFavourite: onToggleFavourite),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          // Spread operator to unpack the list returned by map()
          // ...availableCategories
          //     .map((category) =>  CategoryGridItem(
          //           category: category,
          //         )).toList()

          //                 **********  OR Alternative Method *********
          for (final category in availableCategories)
            CategoryGridItem(
                category: category,
                onSelectCategory: () {
                  _selectCategory(context, category);
                }),
        ],
      ),
    );
  }
}
