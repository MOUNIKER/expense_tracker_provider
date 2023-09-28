// lib/providers/expense_provider.dart

import 'package:flutter/material.dart';
import 'package:expense_tracker_provider/models/expense.dart';

class ExpenseProvider extends ChangeNotifier {
  final List<Expense> _expenses = [];

  List<Expense> get expenses => _expenses;

  void addExpense(Expense expense) {
    _expenses.add(expense);
    notifyListeners();
  }

  void removeExpense(String id) {
    _expenses.removeWhere((expense) => expense.id == id);
    notifyListeners();
  }
}
