import 'package:flutter/material.dart';
import 'package:ui_004_covid_19_tracker/const/app_theme.dart';
import 'package:ui_004_covid_19_tracker/home.dart';
import 'package:ui_004_covid_19_tracker/home_list.dart';

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
      // 1. SingleChildScrollView
      // home: const Home(),
      // 2. ListView.builder
      home: const HomeList(),
    );
  }
}