import 'package:flutter/material.dart';
import 'package:ui_005_pushable_button/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI Challenges Demo',
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}