import 'package:flutter/material.dart';

import '../../ModelClass/expenseModel.dart';

final List<Expense> Userexpenses = [
  Expense(
      title: 'Flutter Course',
      amount: 2500,
      date: DateTime.now(),
      categories: category.Entertainment),
  Expense(
      title: 'Office',
      amount: 1600,
      date: DateTime.now(),
      categories: category.Food),
];



class ExpensesCard extends StatelessWidget {
  const ExpensesCard(this.expense,{super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.outlineVariant,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(expense.title,style:Theme.of(context).textTheme.titleMedium),
            Row(
              children: [
                Text('\$${expense.amount.toStringAsFixed(2)}',style:
                Theme.of(context).textTheme.titleSmall,),
                const Spacer(),
                Icon(categoryIcons[expense.categories]!,color: Theme.of(context).colorScheme.onSurface,),
                SizedBox(width: 5,),
                Text(expense.FormattedDate,style: Theme.of(context).textTheme.titleSmall,),

              ],
            )
          ],
        ),
      ),
    );
  }
}
