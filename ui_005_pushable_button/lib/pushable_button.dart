import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_005_pushable_button/color.dart';

class PushableButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final Color buttonColor;
  final Color textColor;

  const PushableButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.buttonColor = AppColor.red,
    this.textColor = AppColor.white,
  });

  @override
  State<PushableButton> createState() => _PushableButtonState();
}

class _PushableButtonState extends State<PushableButton> {
  // 버튼 클릭 상태 저장 변수
  bool _isPressed = false;

  // Case1: 버튼 클릭중일 경우, true로 변경
  void _onTapDown(TapDownDetails details) {
    setState(() => _isPressed = true);
  }

  // Case2: 버튼 클릭중이 아닌 경우, false로 변경
  void _onTapUp(TapUpDetails details) {
    setState(() => _isPressed = false);
  }

  // Case3: 버튼 위에서 손가락을 떼어서 탭 동작을 완료하지 않을 경우, false로 변경
  // 사용자가 실수로 버튼을 눌렀다가 다른 생각이 들어 손을 버튼 밖으로 옮기고 싶을 경우 Cancel
  void _onTapCancel() {
    setState(() => _isPressed = false);
  }

  @override
  Widget build(BuildContext context) {
    // 상단와 하단 레이어 사이의 거리 정의
    double offset = _isPressed ? 7.0 : 0.0;

    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onTap: widget.onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        // // 버튼 누름 효과 (x,y,z)
        // transform: Matrix4.translationValues(0, _isPressed ? 8:0, 0),

        height: 60,
        width: 300,

        //** Positioned와 Stack 이용하여 버튼 3D 표현 */
        child: Stack(
          children: <Widget>[
            // 하단 입체 효과
            Positioned(
              top: 7, // 기본 위치 고정
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  // Dim 효과(1): 버튼 색상에 투명도 적용
                  // color: widget.buttonColor.withOpacity(0.6),
                  // Dim 효과(2): 버튼 색상 위에 검은색 dim 효과 적용
                  color: Color.lerp(widget.buttonColor, Colors.black, 0.4),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            // 상단 실제 버튼
            Positioned(
              top: offset,
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  color: widget.buttonColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    widget.buttonText,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: widget.textColor,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
