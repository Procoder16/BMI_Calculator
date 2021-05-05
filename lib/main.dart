import 'dart:async';

import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF11292F),
        scaffoldBackgroundColor: Color(0xFF11292F),
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => InputPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF11292F),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'BMI CALCULATOR',
              style: TextStyle(
                fontFamily: 'FreckleFace',
                fontSize: 50.0,
                color: Color(0xFFEDE5CC),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Image.asset(
              'images/cBMI.png',
              height: 200.0,
            ),
            SizedBox(
              height: 50.0,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFEDE5CC)),
            ),
          ],
        ),
      ),
    );
  }
}
