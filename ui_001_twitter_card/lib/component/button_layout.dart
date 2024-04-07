import 'package:flutter/material.dart';
import 'package:ui_001_twitter_card/const/color.dart';

class ButtonLayout extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;

  const ButtonLayout({
    super.key,
    required this.buttonName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        //** 마우스 오버시 버튼 칼라 변경 */
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.hovered)) {
            return AppColor.primary.withOpacity(0.1); // 마우스 오버 시 배경색을 파란색으로 변경
          }
          return Colors.white; // 기본 상태에서의 배경색은 하얀색
        }),

        foregroundColor: MaterialStateProperty.all(AppColor.textBlue),
        elevation: MaterialStateProperty.all(0.0),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: BorderSide(color: AppColor.greyLight), //버튼 테투리 색상
        )),
      ),
      child: Text(
        buttonName,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
