// ignore_for_file: non_constant_identifier_names, curly_braces_in_flow_control_structures, deprecated_member_use

import 'package:bmi/models/colors.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage(
      {super.key,
      required this.isMale,
      required this.age,
      required this.result});
  final bool isMale;
  final int age;
  final double result;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String get resultStatus {
    String Status = '';
    if (widget.result < 18.5)
      Status = 'Underweight';
    else if (widget.result >= 18.5 && widget.result <= 24.9)
      Status = 'Normal';
    else if (widget.result >= 25.0 && widget.result <= 29.9)
      Status = 'Overweight';
    else if (widget.result >= 30) Status = 'Obese';
    return Status;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsPallette().blackColor,
        appBar: AppBar(
          elevation: 1,
          backgroundColor: ColorsPallette().blackColor,
          title: const Text(
            'Result',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xffFDCD43),
            ),
          ),
          centerTitle: true,
        ),
        // backgroundColor: Color.fromARGB(255, 135, 121, 136),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 30,
              ),
              Text("Gender : ${widget.isMale ? 'Male' : 'Female'}",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline2),
              const SizedBox(
                height: 30,
              ),
              Text('Result : ${widget.result.toStringAsFixed(1)}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline2),
              const SizedBox(
                height: 30,
              ),
              Text('Heath Status : $resultStatus',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline2),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Age : ${widget.age}',
                style: Theme.of(context).textTheme.headline2,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
