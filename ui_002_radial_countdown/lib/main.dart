import 'package:flutter/material.dart';
import 'package:ui_002_radial_countdown/const/color.dart';
import 'package:ui_002_radial_countdown/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primary),
        useMaterial3: true,
      ),
      home: const Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}