import 'package:e_commerce_app/provider/item_list_provider.dart';
import 'package:e_commerce_app/view/screen/detail_screen.dart';
import 'package:e_commerce_app/view/screen/home_page.dart';
import 'package:e_commerce_app/view/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
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
        "detail_screen": (context) => FoodDetailsPage(),
      },
    );
  }
}
