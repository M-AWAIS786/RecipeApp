import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal/Model/MealModel.dart';
import 'package:meal/Screens/MealDetails.dart';
import 'package:meal/widgets/meal_item_trail.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.mealModel, required this.onSelectMeal});

  final MealModel mealModel;

  final void Function(MealModel mealModel) onSelectMeal;

/*

How It Works:
Suppose mealModel.affordability has the value Affordability.pricey, then:

mealModel.affordability.name would return "pricey".
mealModel.affordability.name[0].toUpperCase() would convert the first letter "p" to "P".
mealModel.affordability.name.substring(1) would give the rest of the string "ricey".
The result will be "Pricey".

 */

  String get complexityText {
    return mealModel.complexity.name[0].toUpperCase() +
        mealModel.complexity.name.substring(1);
  }

  String get affordabilityText {
    return mealModel.affordability.name[0].toUpperCase() +
        mealModel.affordability.name.substring(1);
  }




  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () => onSelectMeal(mealModel),
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(mealModel.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                color: Colors.black54,
                child: Column(
                  children: [
                    Text(
                      mealModel.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrail(
                          icon: Icons.schedule,
                          label: '${mealModel.duration} min',
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        MealItemTrail(
                          icon: Icons.work,
                          label: '${complexityText}',
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        MealItemTrail(
                          icon: Icons.attach_money,
                          label: '${affordabilityText}',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
