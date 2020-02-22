import 'package:flutter/material.dart';

import 'SplashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: SplashScreen(),
      //home: MyHomePage(title: 'Flutter Main'),
      debugShowCheckedModeBanner: false, //Hide debug label
    );
  }
}
