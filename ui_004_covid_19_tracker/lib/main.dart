import 'package:flutter/material.dart';
import 'package:ui_004_covid_19_tracker/const/app_theme.dart';
import 'package:ui_004_covid_19_tracker/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI Challenges Demo',
      theme: AppTheme.getAppTheme(),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}