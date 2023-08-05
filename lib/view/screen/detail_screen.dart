import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/item_list_provider.dart';

class FoodDetailsPage extends StatefulWidget {
  const FoodDetailsPage({Key? key}) : super(key: key);

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  @override
  Widget build(BuildContext context) {
    int indexData = ModalRoute.of(context)!.settings.arguments as int;
    return Consumer<ItemProvider>(
      builder: (context, provider, child) => Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 750,
                          width: 110,
                          color: Colors.red,
                        ),
                        TweenAnimationBuilder(
                          duration: Duration(seconds: 4),
                          tween: Tween(
                            begin: Alignment.centerLeft,
                            end: Alignment.center,
                          ),
                          builder: (context, val, _) {
                            return Align(
                              alignment: val,
                              child: Container(
                                height: 750,
                                width: 110,
                                color: Colors.red,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
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
                                Navigator.of(context).pop();
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
                          itemCount: provider.AllMenu.length,
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
                                          provider
                                              .AllMenu[indexData][index].image,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${provider.AllMenu[indexData][index].name}",
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
                                        "${provider.AllMenu[indexData][index].items_count} items",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                  FloatingActionButton(
                                    onPressed: () {
                                      provider.changeSize(
                                          sizeh: provider.h + 1,
                                          sizew: provider.w + 1);
                                    },
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 15,
                                      color: Colors.red,
                                    ),
                                    backgroundColor: Colors.white,
                                  )
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
