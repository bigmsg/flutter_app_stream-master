import 'package:flutter/material.dart';
import 'package:flutter_app_stream/GlobalValues.dart';
import 'package:flutter_app_stream/LandingPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GlobalValues(
      child: MaterialApp(
        // title: my_title,
        home: LandingPage(),
      ),
    );
  }
}


