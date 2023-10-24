import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/item_list_provider.dart';

class FoodDetailsPage extends StatefulWidget {
  const FoodDetailsPage({Key? key}) : super(key: key);

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late AnimationController arrowanimationController;
  late Animation flex;
  late Animation rotate;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    arrowanimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    flex = IntTween(begin: 1, end: 20).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
    );

    rotate = Tween(begin: 0.0, end: pi / 2).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
    );
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    int indexData = ModalRoute.of(context)!.settings.arguments as int;

    Size size = MediaQuery.of(context).size;
    return Consumer<ItemProvider>(
      builder: (context, provider, child) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: size.height,
                    width: size.width,
                    child: Row(
                      children: [
                        AnimatedBuilder(
                          animation: animationController,
                          builder: (context, val) => Expanded(
                            flex: flex.value,
                            child: Container(
                              color: Colors.red,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 10,
                          child: Container(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  provider.w;
                                  Navigator.of(context).pushNamed("/");
                                  provider.changeSize(
                                      sizeh: provider.h - 1,
                                      sizew: provider.w - 1);
                                },
                                icon: Icon(
                                  Icons.arrow_back,
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
                        Container(
                          height: 500,
                          width: 350,
                          child: ListView.builder(
                            itemCount:
                                provider.myMenu[indexData]['Item'].length,
                            itemBuilder: (context, index) => Stack(
                              alignment: Alignment(0, 0),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    height: provider.h,
                                    width: provider.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    AnimatedContainer(
                                      duration: Duration(milliseconds: 600),
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            provider.myMenu[indexData]['Item']
                                                [index]['image'],
                                          ),
                                          fit: BoxFit.fill,
                                        ),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
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
                                          "${provider.myMenu[indexData]['Item'][index]['name']}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Text(
                                          "${provider.myMenu[indexData]['Item'][index]['items_count']} items",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                    AnimatedBuilder(
                                        animation: arrowanimationController,
                                        builder: (context, val) {
                                          return GestureDetector(
                                            child: Transform.rotate(
                                              angle: rotate.value,
                                              child: Container(
                                                height: 60,
                                                width: 60,
                                                child: Icon(
                                                  Icons
                                                      .arrow_forward_ios_rounded,
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
                                            ),
                                            onTap: () {
                                              arrowanimationController
                                                  .forward();
                                            },
                                          );
                                        }),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
// ...provider.AllMenu[index].map((e) {
// return Stack(
// alignment: Alignment(0, 0),
// children: [
// Padding(
// padding: const EdgeInsets.all(10),
// child: Container(
// height: provider.h,
// width: provider.w,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(20),
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
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// AnimatedContainer(
// duration: Duration(milliseconds: 600),
// height: 70,
// width: 70,
// decoration: BoxDecoration(
// image: DecorationImage(
// image: AssetImage(
// e.image,
// ),
// fit: BoxFit.fill,
// ),
// color: Colors.white,
// borderRadius: BorderRadius.circular(20),
// boxShadow: [
// BoxShadow(
// blurRadius: 10,
// offset: Offset(5, 5),
// color: Colors.grey,
// )
// ],
// ),
// ),
// Column(
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: [
// Text(
// "${e.name}",
// style: TextStyle(
// color: Colors.black,
// fontWeight: FontWeight.bold,
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
// fontWeight: FontWeight.bold,
// fontSize: 10,
// ),
// ),
// ],
// ),
// FloatingActionButton(
// onPressed: () {
// provider.changeSize(
// sizeh: provider.h + 1,
// sizew: provider.w + 1);
// },
// child: Icon(
// Icons.arrow_forward_ios,
// size: 15,
// color: Colors.red,
// ),
// backgroundColor: Colors.white,
// )
// ],
// ),
// ],
// );
// }).toList(),
