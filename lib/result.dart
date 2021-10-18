import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({
    Key? key,
    required this.result,
    required this.isMale,
    required this.age,
  }) : super(key: key);

  final double result;
  final bool isMale;
  final int age;

  // ignore: non_constant_identifier_names
  String get ResultPhrase {
    // ignore: non_constant_identifier_names
    String ResultText = '';

    if (result >= 30) {
      ResultText = 'Obese';
    } else if (result > 25 && result < 30) {
      ResultText = 'Overweight';
    } else if (result >= 18.5 && result <= 24.9) {
      ResultText = 'Normal';
    } else {
      ResultText = 'thin';
    }
    return ResultText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Gender: ${isMale ? 'Male' : 'Female'}',
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              'Age: $age',
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              'Result: ${result.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              'Healthness: $ResultPhrase',
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.center,
            )
          ],
        ),
      )),
    );
  }
}
