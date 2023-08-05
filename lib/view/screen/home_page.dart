import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.format_list_bulleted,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_basket_outlined,
                  color: Colors.grey,
                  size: 20,
                ),
              ),
            ],
          ),
          // Stack(
          //   children: [
          //     Column(
          //       children: [
          //         Container(
          //           height: double.infinity,
          //           width: 200,
          //           color: Colors.red,
          //         )
          //       ],
          //     )
          //   ],
          // )
        ],
      ),
    );
  }
}
