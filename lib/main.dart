import 'package:bmiapp/result.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';

Map<int, Color> color = {
  50: Color.fromRGBO(0, 0, 139, .1),
  100: Color.fromRGBO(0, 0, 139, .2),
  200: Color.fromRGBO(0, 0, 139, .3),
  300: Color.fromRGBO(0, 0, 139, .4),
  400: Color.fromRGBO(0, 0, 139, .5),
  500: Color.fromRGBO(0, 0, 139, .6),
  600: Color.fromRGBO(0, 0, 139, .7),
  700: Color.fromRGBO(0, 0, 139, .8),
  800: Color.fromRGBO(0, 0, 139, .9),
  900: Color.fromRGBO(0, 0, 139, 1),
};

MaterialColor colorCustom = MaterialColor(0xFF19072E, color);
MaterialColor colorCustom1 = MaterialColor(0xFF00003f, color);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Body Mass Index',
      theme: ThemeData(
          primarySwatch: colorCustom,
          canvasColor: Colors.black,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          textTheme: const TextTheme(
            headline1: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
            headline2: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            headline3: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            bodyText1: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            bodyText2: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          )),
      home: const MyHomePage(),
    );
  }
}
