import 'package:e_commerce_app/model/Item_model.dart';
import 'package:flutter/cupertino.dart';

class ItemProvider extends ChangeNotifier {
  List<ItemModel> foodItems = [
    ItemModel(
        items_count: 25, name: "Pizza", image: "assets/food_image/pizza1.png"),
    ItemModel(
        items_count: 30, name: "Pizza", image: "assets/food_image/pizza1.png"),
    ItemModel(
        items_count: 30, name: "Pizza", image: "assets/food_image/pizza1.png"),
    ItemModel(
        items_count: 44, name: "Pizza", image: "assets/food_image/pizza1.png"),
  ];
}
