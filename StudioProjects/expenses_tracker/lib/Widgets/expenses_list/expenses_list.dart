import 'package:expenses_tracker/ModelClass/expenseModel.dart';
import 'package:expenses_tracker/Widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  ExpensesList({super.key, required this.expenses,required this.onRemoveExpense});

  List<Expense> expenses;

  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
          key: ValueKey(expenses[index]),
          background: Container(
            color:Theme.of(context).colorScheme.error.withOpacity(0.75),
            margin:EdgeInsets.symmetric(horizontal:Theme.of(context).cardTheme.margin!.horizontal),
          ),
          onDismissed: (direction) => onRemoveExpense(expenses[index]),
          child: ExpensesCard(expenses[index])),
    );
  }
}
