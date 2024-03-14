import 'package:flutter/material.dart';
import 'package:weights/screens/departmental_login_screen.dart';
import 'package:weights/screens/splash_screen.dart';
import 'package:weights/screens/try_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: {
        DepartmentalLoginScreen.routeName: (ctx) => DepartmentalLoginScreen(),
        TryScreen.routeName: (ctx) => TryScreen(),
      },
    );
  }
}
