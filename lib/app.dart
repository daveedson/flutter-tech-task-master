import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_task/features/recipes/presentation/view/home_screen.dart';

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
     final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(textTheme)
      ),
      home: HomeScreen(),
    );
  }
}