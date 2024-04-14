import 'package:flutter/material.dart';
import 'package:ui_004_covid_19_tracker/component/card.dart';
import 'package:ui_004_covid_19_tracker/data_temp.dart';

class HomeList extends StatelessWidget {
  const HomeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'COVID-19 Tracker',
        ),
      ),
      //**ListView나 SingleChildScrollView가 Column 안에 있으면 오류 발생!(스크롤 가능한 위젯이 다른 스크롤 가능한 위젯 안에 중첩되어 있는 경우) */
      // 이슈1. 화면에 목록 미출력 : Column으로 정리했던 타이틀과 카드목록을 AppBar와 body로 분리하여 재정리
      //**ListView.Builder는 자식 위젯의 사이즈를 제어하지 않음, 자식 위젯 크기 무제한 확장 가능(SizedBox, Container로 지정한 가로 길이가 적용되지 않음) */
      // 이슈2. 카드 길이 고정안됨 : ListView.Builder를 SizedBox로 랩핑하여 카드의 가로 길이 고정하기
      body: Center(
        child: SizedBox(
          width: 580,
          child: ListView.builder(
            itemCount: covidDataList.length,
            itemBuilder: (context, index) {
              return CardCovid(
                category: covidDataList[index].category,
                imgPath: covidDataList[index].imgPath,
                dataValue: covidDataList[index].dataValue,
                dataColor: covidDataList[index].dataColor,
              );
            },
          ),
        ),
      ),
    );
  }
}
