import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        name: 'Course',
        amount: 60,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        name: 'Movie',
        amount: 20,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  void _addOverlay() {
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(
              addExpense: _addExpense,
            ));
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
      Navigator.pop(context);
    });
  }

  void _removeExpense(Expense expense) {
    final index = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Expense Deleted'),
      duration: const Duration(seconds: 4),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () => setState(() {
          _registeredExpenses.insert(index, expense);
        }),
      ),
    ));
  }

  @override
  Widget build(context) {
    var width = MediaQuery.of(context).size.width;

    Widget emptyList =
        const Center(child: Text('No Expenses Found, Start Adding Some!'));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _addOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: _registeredExpenses),
                const SizedBox(height: 20),
                Expanded(
                  child: _registeredExpenses.isNotEmpty
                      ? ExpensesList(
                          expenses: _registeredExpenses,
                          onRemove: _removeExpense,
                        )
                      : emptyList,
                ),
              ],
            )
          : Row(
              children: [
                Expanded(child: Chart(expenses: _registeredExpenses)),
                const SizedBox(height: 20),
                Expanded(
                  child: _registeredExpenses.isNotEmpty
                      ? ExpensesList(
                          expenses: _registeredExpenses,
                          onRemove: _removeExpense,
                        )
                      : emptyList,
                ),
              ],
            ),
    );
  }
}
