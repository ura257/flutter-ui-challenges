import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ui_002_radial_countdown/const/color.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double progress = 0.0; // 진행 상태를 나타내는 변수 (0.0 ~ 1.0)
  int countNum = 0; // 카운트 다운 숫자 출력 변수
  Timer? timer; // Timer 객체 관리 변수

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel(); // dispose 할때 타이머 같이 취소
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 250,
                    height: 250,
                    child: CircularProgressIndicator(
                      strokeWidth: 20, // 두께 설정
                      value:
                          progress, // 현재 진행 상태에 따라 CircularProgressIndicator 업데이트
                      backgroundColor: AppColor.primaryLight,
                      valueColor: AlwaysStoppedAnimation(AppColor.primary),
                    ),
                  ),
                  Text(
                    '$countNum',
                    style: TextStyle(
                      color: AppColor.primary,
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    countNum = 10;
                    progress = 1.0;
                  });
                  startTimer();
                },
                child: const Text(
                  'Restart',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer?.cancel(); // 기존에 실행 중인 타이머가 있다면 취소하기

    timer = Timer.periodic(oneSec, (Timer timer) {
      if (countNum <= 10 && countNum > 0) {
        setState(() {
          countNum--;
          progress -= 0.1;
        });
      } else {
        timer.cancel();
        setState(() {
          progress = 0.0;
          countNum = 0;
        });
      }
    });
  } //startTimer
}//Home
