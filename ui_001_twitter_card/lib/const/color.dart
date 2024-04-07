import 'package:flutter/material.dart';

// 2. abstract Class : static properties 제공
abstract class AppColor{
  // private constructor : 인스턴트화 실수 방지
  AppColor._();

  static Color primary = Colors.blue;
  static Color pink = Colors.pink;
  static Color grey = const Color(0xFF78747D);
  static Color greyLight = const Color(0xFFC9C4CF);
  static Color textGrey = const Color(0xFF58636F);
  static Color textBlue = const Color.fromARGB(255, 47, 98, 193);
}


// // 1. 전역변수로 관리
// const Color PRIMARY_COLOR = Colors.blue;
// const Color PINK_COLOR = Colors.pink;
// const Color GREY_COLOR = Color(0xFF78747D);
// const Color GREY_LIGHT_COLOR = Color(0xFFC9C4CF);
// const Color GREY_TEXT_COLOR = Color(0xFF58636F);
// const Color BLUE_TEXT_COLOR = Color.fromARGB(255, 47, 98, 193);