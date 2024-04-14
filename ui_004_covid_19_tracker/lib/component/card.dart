import 'package:flutter/material.dart';
import 'package:ui_004_covid_19_tracker/const/app_theme.dart';
import 'package:ui_004_covid_19_tracker/const/color.dart';

class CardCovid extends StatelessWidget {
  final String category; // 전체 사례, 활성 사례, 사망, 회복자 표시
  final String imgPath; // 아이콘 위치(경로)
  final String dataValue; // 데이터 수치
  final Color dataColor; // 데이터 칼라

  const CardCovid({
    super.key,
    required this.category,
    required this.imgPath,
    required this.dataValue,
    required this.dataColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 580,
      height: 120,
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 10.0,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        color: AppColor.primary,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category,
                style: AppTextStyles.cardTitle.copyWith(
                  color: dataColor,
                ),
              ),
              // Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    imgPath,
                    width: 50,
                    height: 50,
                    color: dataColor,
                  ),
                  Text(
                    dataValue,
                    style: AppTextStyles.cardBody.copyWith(
                      color: dataColor,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
