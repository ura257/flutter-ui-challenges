import 'package:flutter/material.dart';
import 'package:ui_003_page_flip/card_flip.dart';
import 'package:ui_003_page_flip/const/color.dart';

class AnimationFlip extends StatefulWidget {
  const AnimationFlip({super.key});

  @override
  State<AnimationFlip> createState() => _AnimationFlipState();
}

class _AnimationFlipState extends State<AnimationFlip>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isFlipped = false;

  @override
  void initState() {
    super.initState();
    // AnimationController 초기화
    _controller = AnimationController(
        // 애니메이션 지속 시간 설정
        duration: Duration(milliseconds: 500),
        vsync: this);

    // Tween을 사용하여 애니메이션 범위 설정
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {}); // setState 호출하여 화면을 다시 그립니다.
      });
  }

  @override
  void dispose() {
    // AnimationController 죽이기
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: _onFlip,
          // 참고 : https://api.flutter.dev/flutter/widgets/AnimatedBuilder-class.html
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              // Transform : 2D 그래픽 변환에 사용되는 위젯(크기 조절, 이동, 회전, 기울이기)
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001) // 3D 효과를 위한 값 설정
                  ..rotateY(_animation.value * 3.141392), // Y축을 중심으로 회전
                child: Container(
                  alignment: Alignment.center,
                  child: _isFlipped
                      ? CardFlip(
                          bgColor: AppColor.modeLightBG,
                          textColor: AppColor.modeLightText,
                          sentence: 'Hello, sunshine!',
                          imageName: 'forest-day.svg',
                        )
                      : CardFlip(
                          bgColor: AppColor.modeDarkBG,
                          textColor: AppColor.modeDarkText,
                          sentence: 'Good night, sleep tight!',
                          imageName: 'forest-night.svg',
                        ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _onFlip() {
    if (!_isFlipped) {
      _controller.forward(); // 앞면에서 뒷면으로 애니메이션 전환
    } else {
      _controller.reverse(); // 뒷면에서 앞면으로 애니메이션 전환
    }
    _isFlipped = !_isFlipped;
  }
}//AnimationDemo
