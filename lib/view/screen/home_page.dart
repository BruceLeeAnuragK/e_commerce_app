import 'package:e_commerce_app/provider/item_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ItemProvider>(
      builder: (context, provider, child) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 750,
                          width: 110,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: TweenAnimationBuilder(
                        duration: Duration(milliseconds: 600),
                        curve: Curves.bounceOut,
                        tween: Tween(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                        builder: (context, val, _) {
                          return Align(
                            alignment: val,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(50),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.format_list_bulleted,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.shopping_basket_outlined,
                                          color: Colors.grey,
                                          size: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                ...provider.foodItems.map((e) {
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
                                          AnimatedContainer(
                                            duration:
                                                Duration(milliseconds: 600),
                                            height: 70,
                                            width: 70,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                  e.image,
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
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${e.name}",
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
                                                "${e.items_count} items",
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
                                              Navigator.of(context)
                                                  .pushNamed("detail_screen");
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                }).toList(),
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
