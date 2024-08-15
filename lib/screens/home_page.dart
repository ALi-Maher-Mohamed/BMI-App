// ignore_for_file: deprecated_member_use, non_constant_identifier_names

import 'dart:math';

import 'package:bmi/screens/result_page.dart';
import 'package:bmi/models/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isMale = true;
  double hight = 110;
  int weight = 40;
  int age = 10;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff111B21),
        appBar: AppBar(
          backgroundColor: ColorsPallette().blackColor,
          title: Text(
            'BMI',
            style: Theme.of(context).textTheme.headline2,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  GenderCategory('male'),
                  const SizedBox(
                    width: 15,
                  ),
                  GenderCategory('female'),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorsPallette().blackColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Height',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Row(
                        textBaseline: TextBaseline.alphabetic,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            hight.toStringAsFixed(1),
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          Text(
                            'CM',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ],
                      ),
                      Slider(
                        min: 90,
                        max: 250,
                        value: hight,
                        onChanged: (newvalue) =>
                            setState(() => hight = newvalue),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  wightAndage('weight'),
                  const SizedBox(
                    width: 15,
                  ),
                  wightAndage('age'),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                  onTap: () {
                    var result = weight / pow((hight / 100), 2);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ResultPage(
                          isMale: isMale, age: age, result: result);
                    }));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 10,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: ColorsPallette().blackColor),
                    alignment: Alignment.center,
                    child: Text(
                      'Calculate',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Expanded GenderCategory(String type) {
    return Expanded(
        child: GestureDetector(
      onTap: () => setState(() => isMale = type == 'male' ? true : false),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: (isMale && type == 'male') ||
                    (!isMale && type == 'female') == true
                ? ColorsPallette().mintGreenColor
                : ColorsPallette().blackColor),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                type == 'male' ? Icons.male : Icons.female,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                type == 'male' ? 'Male' : 'Female',
                style: Theme.of(context).textTheme.headline2,
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Expanded wightAndage(String type) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: ColorsPallette().blackColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              type == 'age' ? 'Age' : 'Weight',
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              type == 'age' ? '$age' : '$weight',
              style: Theme.of(context).textTheme.headline3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // SizedBox(
                //   width: 1,
                // ),
                FloatingActionButton(
                  shape: const CircleBorder(),
                  onPressed: () {
                    setState(() {
                      type == 'age' ? age++ : weight++;
                    });
                  },
                  heroTag: type == 'age' ? 'age++' : 'weight++',
                  backgroundColor: ColorsPallette().mintGreenColor,
                  child: const Icon(Icons.add),
                ),
                const SizedBox(
                  width: 7,
                ),
                FloatingActionButton(
                  shape: const CircleBorder(),
                  heroTag: type == 'age' ? 'age--' : 'weight--',
                  onPressed: () {
                    setState(() {
                      type == 'age' ? age-- : weight--;
                    });
                  },
                  backgroundColor: ColorsPallette().mintGreenColor,
                  child: const Icon(Icons.remove),
                ),
                // SizedBox(
                //   width: 1,
                // ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
