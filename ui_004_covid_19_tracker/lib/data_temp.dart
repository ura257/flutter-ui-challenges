import 'package:flutter/material.dart';
import 'package:ui_004_covid_19_tracker/const/color.dart';

class CovidData {
  final String category; // 전체 사례, 활성 사례, 사망, 회복자 표시
  final String imgPath; // 아이콘 위치(경로)
  final String dataValue; // 데이터 수치
  final Color dataColor; // 데이터 칼라

  CovidData({
    required this.category,
    required this.imgPath,
    required this.dataValue,
    required this.dataColor,
  });
}

List<CovidData> covidDataList = [
  CovidData(
    category: 'Total Cases',
    imgPath: 'asset/images/count.png',
    dataValue: '9,231,249',
    dataColor: AppColor.yellow,
  ),
  CovidData(
    category: 'Active Cases',
    imgPath: 'asset/images/fever.png',
    dataValue: '123,214',
    dataColor: Colors.orange,
  ),
  CovidData(
    category: 'Deaths',
    imgPath: 'asset/images/death.png',
    dataValue: '51,245',
    dataColor: Colors.red,
  ),
  CovidData(
    category: 'Recovered',
    imgPath: 'asset/images/patient.png',
    dataValue: '7,452,340',
    dataColor: Colors.green,
  ),
];
