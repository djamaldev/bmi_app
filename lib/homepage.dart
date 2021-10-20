import 'dart:math';

import 'package:bmiapp/result.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;
  double heughtVal = 100;
  double weight = 50.0;
  int age = 25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
        child: Container(
          //alignment: Alignment.center,
          width: 600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        expandedMethod1(context, 'male'),
                        const SizedBox(width: 15),
                        expandedMethod1(context, 'female'),
                      ],
                    )),
              ),
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blueGrey,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Height',
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  heughtVal.toStringAsFixed(1),
                                  style: Theme.of(context).textTheme.headline1,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'cm',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ],
                            ),
                            Slider(
                              value: heughtVal,
                              min: 0,
                              max: 250,
                              onChanged: (newVal) {
                                setState(() {
                                  heughtVal = newVal;
                                });
                              },
                            )
                          ],
                        ))),
              ),
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        expandedMethod2(context, 'age'),
                        const SizedBox(width: 15),
                        expandedMethod2(context, 'weight'),
                      ],
                    )),
              ),
              Container(
                color: Theme.of(context).primaryColor,
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 16,
                child: TextButton(
                  child: Text(
                    'Calculate',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  onPressed: () {
                    var result = weight / pow(heughtVal / 100, 2);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Result(
                              result: result, isMale: isMale, age: age);
                        },
                      ),
                    );
                  },
                ),
              ),
              Container(
                //color: Theme.of(context).primaryColor,
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 16,
                child: Center(
                  child: Text(
                    'Djamal Yacine Contact me at: djaminf@hotmail.fr',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  Expanded expandedMethod1(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMale = (type == 'male') ? true : false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: (isMale && type == 'male') || (!isMale && type == 'female')
                ? Colors.blueAccent
                : Colors.blueGrey,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(type == 'male' ? Icons.male : Icons.female, size: 60),
              const SizedBox(
                height: 16,
              ),
              Text(
                type == 'male' ? 'Male' : 'Female',
                style: Theme.of(context).textTheme.headline2,
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded expandedMethod2(BuildContext context, String type) {
    double numWeight = double.parse((weight).toStringAsFixed(2));
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blueGrey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              type == 'age' ? 'Age' : 'Weight',
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              type == 'age' ? '$age' : '$numWeight',
              style: Theme.of(context).textTheme.headline1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: type == 'age' ? 'age--' : 'weight--',
                  child: const Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      type == 'age' ? age-- : weight--;
                    });
                  },
                ),
                const SizedBox(
                  width: 8.0,
                ),
                FloatingActionButton(
                  heroTag: type == 'age' ? 'age++' : 'weight++',
                  child: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      type == 'age' ? age++ : weight++;
                    });
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
