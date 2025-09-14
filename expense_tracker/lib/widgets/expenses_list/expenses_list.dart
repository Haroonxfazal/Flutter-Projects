import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_view.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {required this.expenses, required this.onRemove, super.key});

  final List<Expense> expenses;
  final void Function(Expense) onRemove;
  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        background: Container(
          color: Theme.of(context).brightness == Brightness.dark
              ? const Color.fromARGB(255, 26, 124, 205).withOpacity(0.75)
              : Theme.of(context).colorScheme.error.withOpacity(0.75),
          margin: EdgeInsets.symmetric(
              horizontal: Theme.of(context).cardTheme.margin!.horizontal),
        ),
        onDismissed: (direction) {
          onRemove(expenses[index]);
        },
        key: ValueKey(expenses[index]),
        child: ExpenseView(expenses[index]),
      ),
    );
  }
}
