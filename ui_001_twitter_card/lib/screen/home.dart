import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ui_001_twitter_card/component/card_responsive.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // DateTime twitTime = DateTime(2023, 6, 20, 10, 21);
    // intl의 DateFormat 클래스 : 원하는 형식으로 날짜와 시간을 포맷팅
    // 'a'는 AM 또는 PM 자동 표시, 'MMM'은 월의 축약된 이름(ex.Jan, Dec)
    DateTime twitTime = DateTime.now();
    String formattedDate = DateFormat('h:mm a MMM d, yyyy').format(twitTime);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CardResponsive(
                formattedDate: formattedDate,
              ),
            ],
          ),
        ),
      ),
    );
  }
} //Home

