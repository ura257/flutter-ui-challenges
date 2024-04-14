import 'package:flutter/material.dart';
import 'package:ui_004_covid_19_tracker/component/card.dart';
import 'package:ui_004_covid_19_tracker/const/app_theme.dart';
import 'package:ui_004_covid_19_tracker/const/color.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            // clipBehavior: Clip.none, // 위젯이 잘리지 않게 스크롤
            // physics: AlwaysScrollableScrollPhysics(), // 스크롤 - AOS 튕김 없음, iOS 튕김 있음
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'COVID-19 Tracker',
                    style: AppTextStyles.title,
                  ),
                  SizedBox(height: 10.0),
                  CardCovid(
                    category: 'Total Cases',
                    imgPath: 'asset/images/count.png',
                    dataValue: '9,231,249',
                    dataColor: AppColor.yellow,
                  ),
                  CardCovid(
                    category: 'Active Cases',
                    imgPath: 'asset/images/fever.png',
                    dataValue: '123,214',
                    dataColor: Colors.orange,
                  ),
                  CardCovid(
                    category: 'Deaths',
                    imgPath: 'asset/images/death.png',
                    dataValue: '51,245',
                    dataColor: Colors.red,
                  ),
                  CardCovid(
                    category: 'Recovered',
                    imgPath: 'asset/images/patient.png',
                    dataValue: '7,452,340',
                    dataColor: Colors.green,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}//Home
