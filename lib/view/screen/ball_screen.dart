import 'package:flutter/material.dart';

class BallScreen extends StatefulWidget {
  const BallScreen({super.key});

  @override
  State<BallScreen> createState() => _BallScreenState();
}

class _BallScreenState extends State<BallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ball Screen"),
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 300,
            width: 300,
            color: Colors.red,
          ),
          TweenAnimationBuilder(
            tween: Tween(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            duration: Duration(
              milliseconds: 2300,
            ),
            curve: Curves.bounceOut,
            builder: (context, val, _) => Align(
              alignment: val,
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://i.pinimg.com/564x/27/01/0f/27010fe9a14f64394eb818c5883d1c88.jpg'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
