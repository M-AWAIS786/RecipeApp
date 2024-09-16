import 'package:expenses_tracker/ModelClass/expenseModel.dart';
import 'package:expenses_tracker/Widgets/expenses_list/expenses_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NewExpensesState extends StatefulWidget {
  const NewExpensesState({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpensesState> createState() => _NewExpensesStateState();
}

class _NewExpensesStateState extends State<NewExpensesState> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  category _selectedCategory = category.Food;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    print(firstDate);
    final pickedDate = await showDatePicker(
        context: context, firstDate: firstDate, lastDate: now);

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;

    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
            title: Text('Invalid Input'),
            content: Text(
                'Please make sure to enter valid title, amount, date and category.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Ok'),
              ),
            ]),
      );
      return;
    }
    widget.onAddExpense(Expense(
        title: _titleController.text,
        amount: enteredAmount,
        date: _selectedDate!,
        categories: _selectedCategory));
    Navigator.pop(context);
  }

  // void openAddExpenseOverlay(){
  //   showModalBottomSheet(context: context, builder: (context) => NewExpensesState(onAddExpense: addExpense),);
  // }

  void addExpense(Expense expense) {
    setState(() {
      Userexpenses.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: InputDecoration(label: Text('Title',style: Theme.of(context).textTheme.titleSmall),)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration:  InputDecoration(
                      prefixText: '\$', label: Text('Amount',style: Theme.of(context).textTheme.titleSmall),)),
                ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Text(_selectedDate == null
                        ? 'No Date Chosen'
                        : formatter.format(_selectedDate!),style: Theme.of(context).textTheme.titleSmall,),
                    IconButton(
                        onPressed: _presentDatePicker,
                        icon: Icon(Icons.calendar_month))
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: category.values
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(
                            style: Theme.of(context).textTheme.titleSmall,
                            category.name.toString(),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      if (value == null) {
                        return;
                      }
                      _selectedCategory = value;
                    });
                  }),
              Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
              ElevatedButton(
                onPressed: _submitExpenseData,
                child: Text('Save Expenses'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
