// lib/main.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:expense_tracker_provider/providers/expense_provider.dart';
import 'package:expense_tracker_provider/screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // First Provider
        ChangeNotifierProvider(
          create: (context) => ExpenseProvider(),
        ),
       
      ],
      child:const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Expense Tracker',
        home:  HomeScreen(),
      ),
    );
  }
}


