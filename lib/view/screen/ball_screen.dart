import 'package:flutter/material.dart';

class BallScreen extends StatefulWidget {
  const BallScreen({super.key});

  @override
  State<BallScreen> createState() => _BallScreenState();
}

class _BallScreenState extends State<BallScreen> with TickerProviderStateMixin {
  late AnimationController animationController;
  late AnimationController flexanimationController;
  late AnimationController slideanimationController;
  late Animation slide;
  late Animation flex;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 5000,
      ),
    );
    flexanimationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 1000,
      ),
    );
    slideanimationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 1000,
      ),
    );

    flex = IntTween(begin: 1, end: 20).animate(
      CurvedAnimation(
        parent: flexanimationController,
        curve: Curves.easeInOut,
      ),
    );

    slide = Tween(
      begin: -300,
      end: 0.0,
    ).animate(
      CurvedAnimation(
          parent: slideanimationController, curve: Curves.easeInOut),
    );
    slideanimationController.forward();
    flexanimationController.forward();
  }

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
          AnimatedBuilder(
              animation: animationController,
              builder: (context, val) {
                return Container(
                  height: 300,
                  width: 300,
                  color: Colors.red,
                );
              }),
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
