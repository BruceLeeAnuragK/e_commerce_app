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
      const Duration(seconds: 15),
      () {
        Navigator.of(context).pushNamed("/");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TweenAnimationBuilder(
              tween: Tween(begin: 0.0, end: pi * 2),
              duration: Duration(seconds: 10),
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
            TweenAnimationBuilder(
                duration: Duration(seconds: 5),
                tween: Tween(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                ),
                builder: (context, val, _) {
                  return Container(
                    child: Text(
                      "Food App",
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.yellow.shade900,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }),
            CircularProgressIndicator(
              color: Colors.yellow.shade900,
            ),
          ],
        ),
      ),
    );
  }
}
