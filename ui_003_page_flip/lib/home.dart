import 'package:flutter/material.dart';
import 'package:page_flip_builder/page_flip_builder.dart';
import 'package:ui_003_page_flip/card_flip.dart';
import 'package:ui_003_page_flip/const/color.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // 참고 : https://pub.dev/packages/page_flip_builder
        // add a black background to prevent flickering on Android when the page flips
        color: Colors.black,
        child: PageFlipBuilder(
          frontBuilder: (_) => CardFlip(
            bgColor: AppColor.modeLightBG,
            textColor: AppColor.modeLightText,
            sentence: 'Hello, sunshine!',
            imageName: 'forest-day.svg',
          ),
          backBuilder: (_) => CardFlip(
            bgColor: AppColor.modeDarkBG,
            textColor: AppColor.modeDarkText,
            sentence: 'Good night, sleep tight!',
            imageName: 'forest-night.svg',
          ),
        ),
      ),
    );
  }
}
