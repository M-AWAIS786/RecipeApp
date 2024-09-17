

import 'package:flutter/material.dart';
import 'package:meal/Model/CategoriesModel.dart';

class CategoryGridItem extends StatelessWidget{
  const CategoryGridItem({super.key,required this.category, required  this.onSelectCategory});

  final CategoryModel category;
  final void Function() onSelectCategory;


  @override
  Widget build(BuildContext context) {
        return InkWell(
          onTap:onSelectCategory,
          splashColor: Theme.of(context).secondaryHeaderColor,
          borderRadius: BorderRadius.circular(15),
          child: Container(
            decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(15),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  category.color.withOpacity(0.55),
                  category.color.withOpacity(0.9),
                ]
              )
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                category.title,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color:Theme.of(context).colorScheme.primary
                ),),
            )
          ),
        );
  }

}