import 'package:expenses_tracker/ModelClass/expenseModel.dart';
import 'package:expenses_tracker/Widgets/expenses_list/expenses_item.dart';
import 'package:expenses_tracker/Widgets/expenses_list/expenses_list.dart';
import 'package:expenses_tracker/Widgets/new_expenses.dart';
import 'package:flutter/material.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  void _openAddExpense() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => NewExpensesState(onAddExpense: addExpense));
  }

  void addExpense(Expense expense) {
    setState(() {
      Userexpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = Userexpenses.indexOf(expense);
    setState(() {
      Userexpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: Text('Expense deleted'),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              Userexpenses.insert(expenseIndex, expense);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(
      child: Text('No expenses found'),
    );
    if (Userexpenses.isNotEmpty) {
      mainContent =
          ExpensesList(expenses: Userexpenses, onRemoveExpense: _removeExpense);
    }
    return Scaffold(
        appBar: AppBar(
          title: Text('Expenses'),
          actions: [
            IconButton(onPressed: _openAddExpense, icon: Icon(Icons.add)),
          ],
        ),
        body: Column(
          children: [
            Expanded(
                child: mainContent),
          ],
        ));
  }
}
