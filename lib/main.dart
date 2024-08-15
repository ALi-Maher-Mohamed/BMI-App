// import 'package:bmi/screens/home_page.dart';
// ignore_for_file: deprecated_member_use, duplicate_ignore

import 'package:bmi/screens/home_page.dart';
import 'package:bmi/screens/result_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BMI());
}

class BMI extends StatefulWidget {
  const BMI({super.key});

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        iconTheme: const IconThemeData(
          size: 90,
          color: Colors.white,
        ),
        textTheme: const TextTheme(
          // ignore: deprecated_member_use
          headline2: TextStyle(
            color: Color(0xffFDCD43),
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
          headline5: TextStyle(
            fontSize: 20,
            color: Color(0xffFDCD43),
            fontWeight: FontWeight.bold,
          ),
          headline3: TextStyle(
            fontSize: 45,
            fontWeight: FontWeight.bold,
            color: Color(0xffFDCD43),
          ),
        ),
      ),
      routes: {
        'resultPage': (context) => const ResultPage(
              age: 25,
              isMale: true,
              result: 22.9,
            )
      },
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
