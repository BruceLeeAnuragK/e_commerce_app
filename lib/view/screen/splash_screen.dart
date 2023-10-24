import 'dart:math';

import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 5),
      () {
        Navigator.of(context).pushNamed("login_page");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: TweenAnimationBuilder(
                tween: Tween(begin: 0.0, end: pi * 2),
                duration: Duration(seconds: 5),
                builder: (context, val, _) {
                  return Transform.rotate(
                    angle: val,
                    child: Container(
                      height: 250,
                      width: double.infinity,
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          image: AssetImage("assets/food_image/pizza1.png"),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: TweenAnimationBuilder(
                duration: const Duration(seconds: 5),
                tween: Tween(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
                builder: (context, val, _) {
                  return Align(
                    alignment: val,
                    child: Container(
                      height: 100,
                      width: 300,
                      child: Text(
                        "Food App",
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.yellow.shade900,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
