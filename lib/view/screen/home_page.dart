import 'dart:math';

import 'package:e_commerce_app/provider/item_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController animationController;
  late AnimationController flexanimationController;
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
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );
    flexanimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<ItemProvider>(
      builder: (context, provider, child) => Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: size.height,
                  width: size.width,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 10,
                        child: Container(
                          color: Colors.red,
                        ),
                      ),
                      AnimatedBuilder(
                        animation: flexanimationController,
                        builder: (context, val) => Expanded(
                          flex: flex.value,
                          child: Container(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.format_list_bulleted,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          AnimatedBuilder(
                              animation: animationController,
                              builder: (context, val) {
                                return IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.shopping_basket_outlined,
                                    color: Colors.grey,
                                    size: 30,
                                  ),
                                );
                              }),
                        ],
                      ),
                    ),
                    AnimatedBuilder(
                        animation: animationController,
                        builder: (context, val) {
                          return Container(
                            height: 500,
                            width: 350,
                            child: ListView.builder(
                              itemCount: provider.foodItems.length,
                              itemBuilder: (context, index) {
                                return Stack(
                                  alignment: Alignment(0, 0),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Container(
                                        height: provider.h,
                                        width: provider.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 20,
                                              color: Colors.grey,
                                              offset: Offset(5, 5),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        TweenAnimationBuilder(
                                            tween: Tween(
                                              begin: 0.0,
                                              end: pi * 2,
                                            ),
                                            duration: Duration(seconds: 10),
                                            builder: (context, val, _) {
                                              return Transform.rotate(
                                                angle: val,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    provider.changerotating();
                                                  },
                                                  child: Container(
                                                    height: 70,
                                                    width: 70,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                          provider
                                                              .foodItems[index]
                                                              .image,
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                      color: Colors.amber,
                                                      shape: BoxShape.circle,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 10,
                                                          offset: Offset(5, 5),
                                                          color: Colors.grey,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${provider.foodItems[index].name}",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "${provider.foodItems[index].items_count} items",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          child: Container(
                                            height: 60,
                                            width: 60,
                                            child: Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              size: 20,
                                              color: Colors.red,
                                            ),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  offset: Offset(
                                                    5,
                                                    5,
                                                  ),
                                                  blurRadius: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                          onTap: () {
                                            provider.changeSize(
                                                sizeh: provider.h + 1,
                                                sizew: provider.w + 1);
                                            Navigator.of(context).pushNamed(
                                                "detail_screen",
                                                arguments: index);
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            ),
                          );
                        }),
                  ],
                ),
              ],
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed("ball_screen");
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
// ...provider.foodItems.map((e) {
// return Stack(
// alignment: Alignment(0, 0),
// children: [
// Padding(
// padding: const EdgeInsets.all(10),
// child: Container(
// height: provider.h,
// width: provider.w,
// decoration: BoxDecoration(
// borderRadius:
// BorderRadius.circular(20),
// color: Colors.white,
// boxShadow: [
// BoxShadow(
// blurRadius: 20,
// color: Colors.grey,
// offset: Offset(5, 5),
// ),
// ],
// ),
// ),
// ),
// Row(
// mainAxisAlignment:
// MainAxisAlignment.spaceEvenly,
// crossAxisAlignment:
// CrossAxisAlignment.center,
// children: [
// TweenAnimationBuilder(
// tween: Tween(
// begin: 0.0,
// end: pi * 2,
// ),
// duration:
// Duration(seconds: 10),
// builder: (context, val, _) {
// return Transform.rotate(
// angle:
// provider.IsRotating
// ? val
//     : 0.0,
// child: GestureDetector(
// onTap: () {
// provider.changerotating(
// rotate: provider
//     .IsRotating);
// },
// child: Container(
// height: 70,
// width: 70,
// decoration:
// BoxDecoration(
// image:
// DecorationImage(
// image:
// AssetImage(
// e.image,
// ),
// fit: BoxFit
//     .cover,
// ),
// color:
// Colors.amber,
// shape: BoxShape
//     .circle,
// boxShadow: [
// BoxShadow(
// blurRadius:
// 10,
// offset:
// Offset(
// 5, 5),
// color: Colors
//     .grey,
// )
// ],
// ),
// ),
// ),
// );
// }),
// Column(
// mainAxisAlignment:
// MainAxisAlignment.center,
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: [
// Text(
// "${e.name}",
// style: TextStyle(
// color: Colors.black,
// fontWeight:
// FontWeight.bold,
// fontSize: 20,
// ),
// ),
// const SizedBox(
// height: 5,
// ),
// Text(
// "${e.items_count} items",
// style: TextStyle(
// color: Colors.grey,
// fontWeight:
// FontWeight.bold,
// fontSize: 10,
// ),
// ),
// ],
// ),
// GestureDetector(
// child: Container(
// height: 60,
// width: 60,
// child: Icon(
// Icons
//     .arrow_forward_ios_rounded,
// size: 20,
// color: Colors.red,
// ),
// decoration: BoxDecoration(
// shape: BoxShape.circle,
// color: Colors.white,
// boxShadow: [
// BoxShadow(
// color: Colors.grey,
// offset: Offset(
// 5,
// 5,
// ),
// blurRadius: 10,
// ),
// ],
// ),
// ),
// onTap: () {
// provider.changeSize(
// sizeh: provider.h + 1,
// sizew: provider.w + 1);
// Navigator.of(context)
//     .pushNamed(
// "detail_screen",
// arguments: "");
// },
// ),
// ],
// ),
// ],
// );
// }).toList(),
