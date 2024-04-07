import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardFlip extends StatelessWidget {
  final Color bgColor;
  final Color textColor;
  final String sentence;
  final String imageName;

  const CardFlip({
    super.key,
    required this.bgColor,
    required this.textColor,
    required this.sentence,
    required this.imageName,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        // Container -> SizedBox
        child: Container(
          color: bgColor,
          width: 500,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 50, 30, 50),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // ** Text에 Flexible 랩핑하여 줄바꿈
                    Flexible(
                      child: Text(
                        sentence,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 180,
                    ),
                    SvgPicture.asset(
                      'asset/images/man.svg',
                      width: 50,
                      height: 50,
                    ),
                  ],
                ),
                const Spacer(flex: 1),
                SvgPicture.asset(
                  'asset/images/$imageName',
                  width: 350,
                  height: 350,
                ),
                const Spacer(flex: 1),
                IconButton(
                  onPressed: () {
                    // button Click Flip
                  },
                  icon: Icon(
                    Icons.flip,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} //Home
