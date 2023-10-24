import 'package:e_commerce_app/view/screen/ball_screen.dart';
import 'package:e_commerce_app/view/screen/detail_screen.dart';
import 'package:e_commerce_app/view/screen/home_page.dart';
import 'package:e_commerce_app/view/screen/login_screen.dart';
import 'package:e_commerce_app/view/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'controller/item_list_provider.dart';
import 'firebase_options.dart';

void main() async {
// ...

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ItemProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
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
        "login_page": (context) => LoginPage(),
        "detail_screen": (context) => FoodDetailsPage(),
        "ball_screen": (context) => BallScreen(),
      },
    );
  }
}
