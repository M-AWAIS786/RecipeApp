import 'package:flutter/material.dart';
import 'package:meal/Model/MealModel.dart';
import 'package:meal/Screens/MealDetails.dart';
import 'package:meal/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
   MealsScreen({super.key, this.title,required this.meals, required this.onToggleFavourite});

   final String? title;
  final List<MealModel> meals;
   final void Function(MealModel mealModel) onToggleFavourite;

  void onselectedMeal(BuildContext context, MealModel mealModel) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MealDetailsScreen(mealModel: mealModel,
      onToggleFavourite: onToggleFavourite,),));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) =>
          MealItem(
            mealModel: meals[index],
            onSelectMeal:(mealModel) {
              onselectedMeal(context, mealModel);
            },
          ),
    );

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Uh oh ... nothing here!',
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme
                  .of(context)
                  .colorScheme
                  .primary),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Try selecting a different category!',
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme
                  .of(context)
                  .colorScheme
                  .onPrimary),
            )
          ],
        ),
      );
    }

    if(title == null){
       return content;
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content);
  }
}
