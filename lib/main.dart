import 'package:flutter/material.dart';

import 'onboarding.dart';

void main()
{
  runApp(NewsApp());
}


class NewsApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoarding(),
    );
  }
}



class testName{
  int _age;
  String _name;

  testName(this._age, this._name);

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get age => _age;

  set age(int value) {
    _age = value;
  }
}

