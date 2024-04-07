import 'package:flutter/material.dart';
import 'package:ui_001_twitter_card/component/img_svg.dart';
import 'package:ui_001_twitter_card/const/color.dart';
import 'package:ui_001_twitter_card/const/set_num.dart';

class IconTextLayout extends StatelessWidget {
  final String lable;
  final String imgName; // svg 이미지 파일명
  final bool applyColorFilter; // 색상 필터 적용 여부
  final Color? imgColor; // 색상 필터 사용시 색상
  final double width; // 이미지 너비
  final double height; // 이미지 높이

  const IconTextLayout({
    super.key,
    required this.lable,
    required this.imgName,
    this.applyColorFilter = false,
    this.imgColor,
    this.width = ICON_SIZE,
    this.height = ICON_SIZE,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ImgSvg(
          imgName: imgName,
          applyColorFilter: applyColorFilter,
          imgColor: imgColor,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          child: Text(
            lable,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColor.textGrey,
            ),
          ),
        ),
      ],
    );
  }
}
