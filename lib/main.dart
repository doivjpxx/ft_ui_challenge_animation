import 'package:flutter/material.dart';
import 'package:ui_challenge_animation/animation_1.dart';
import 'package:ui_challenge_animation/animation_3.dart';
import 'package:ui_challenge_animation/animation_4.dart';

import 'animation_2/animation_2.dart';
import 'home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation',
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/first': (context) => MyAnimation1(),
        '/second': (context) => MyAnimation2(),
        '/third': (context) => MyAnimation3(),
        '/four': (context) => MyAnimation4()
      },
    );
  }
}
