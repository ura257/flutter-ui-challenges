import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_001_twitter_card/const/set_num.dart';

class ImgSvg extends StatelessWidget {
  final String imgName; // svg 이미지 파일명
  final bool applyColorFilter; // 색상 필터 적용 여부
  final Color? imgColor; // 색상 필터 사용시 색상
  final double width; // 이미지 너비
  final double height; // 이미지 높이

  const ImgSvg({
    super.key,
    required this.imgName,
    this.applyColorFilter = false,
    this.imgColor,
    this.width = ICON_SIZE,
    this.height = ICON_SIZE,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'asset/images/${imgName}.svg',
      width: width,
      height: height,
      fit: BoxFit.cover,
      // "??" 널 병합 연산자 : imgColor 값이 널일 경우, 투명한 색상으로 대체할 값 지정
      // BlendMode.srcIn : 특정 형태로 이미지나 위젯의 색상을 적용하고 싶을 때 사용
      colorFilter: applyColorFilter ? ColorFilter.mode(imgColor ?? Colors.transparent, BlendMode.srcIn) : null,
    );
  }
}
