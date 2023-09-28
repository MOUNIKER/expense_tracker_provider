// lib/screens/add_expense_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:expense_tracker_provider/models/expense.dart';
import 'package:expense_tracker_provider/providers/expense_provider.dart';

class AddExpenseScreen extends StatelessWidget {
  const AddExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController amountController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Expense'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Expense Title'),
            ),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Amount'),
            ),
            ElevatedButton(
              onPressed: () {
                final String title = titleController.text;
                final double amount = double.tryParse(amountController.text) ?? 0.0;

                if (title.isNotEmpty && amount > 0) {
                  final Expense newExpense = Expense(
                    id: DateTime.now().toString(),
                    title: title,
                    amount: amount,
                  );

                  Provider.of<ExpenseProvider>(context, listen: false)
                      .addExpense(newExpense);

                  Navigator.of(context).pop();
                }
              },
              child:const  Text('Add Expense'),
            ),
          ],
        ),
      ),
    );
  }
}
