import 'package:flutter/material.dart';
import 'package:ui_005_pushable_button/color.dart';
import 'package:ui_005_pushable_button/pushable_button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _buttonClickText = 'none';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PushableButton(
              onPressed: () {
                setState(() {
                  _buttonClickText = '1';
                });
              },
              buttonText: 'PUSH ME',
              buttonColor: AppColor.red,
            ),
            const SizedBox(height: 30),
            PushableButton(
              onPressed: () {
                setState(() {
                  _buttonClickText = '2';
                });
              },
              buttonText: 'ENROLL NOW',
              buttonColor: AppColor.green,
            ),
            const SizedBox(height: 30),
            PushableButton(
              onPressed: () {
                setState(() {
                  _buttonClickText = '3';
                });
              },
              buttonText: 'ADD TO BASKET',
              buttonColor: AppColor.blue,
            ),
            const SizedBox(height: 30),
            Text(
              'Pushed: $_buttonClickText',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
