import 'package:flutter/material.dart';
import 'package:tech_task/features/recipes/presentation/view/ingredients_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IngredientsScreen(),
    );
  }
}