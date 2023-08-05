import 'package:e_commerce_app/view/screen/home_page.dart';
import 'package:e_commerce_app/view/screen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "splash_screen",
      routes: {
        "splash_screen": (context) => IntroScreen(),
        "/": (context) => HomePage(),
      },
    );
  }
}
