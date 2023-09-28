// lib/screens/home_screen.dart

import 'package:expense_tracker_provider/screens/add_expense_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:expense_tracker_provider/providers/expense_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final expenseProvider = Provider.of<ExpenseProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title:const  Text('Expense Tracker'),
      ),
      body: ListView.builder(
        itemCount: expenseProvider.expenses.length,
        itemBuilder: (context, index) {
          final expense = expenseProvider.expenses[index];
          return ListTile(
            title: Text(expense.title),
            subtitle: Text('\$${expense.amount.toStringAsFixed(2)}'),
            trailing: IconButton(
              icon:const  Icon(Icons.delete),
              onPressed: () {
                expenseProvider.removeExpense(expense.id);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>const  AddExpenseScreen(),
            ),
          );
          // Navigate to a screen to add a new expense (not implemented yet)
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
