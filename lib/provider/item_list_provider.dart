import 'package:e_commerce_app/model/Item_model.dart';
import 'package:flutter/cupertino.dart';

class ItemProvider extends ChangeNotifier {
  double h = 100;
  double w = 250;

  changeSize({required double sizeh, required double sizew}) {
    h = sizeh;
    w = sizew;
    notifyListeners();
  }

  List<ItemModel> foodItems = [
    ItemModel(
      items_count: 25,
      name: "Pizza",
      image: "assets/food_image/pizza1.png",
    ),
    ItemModel(
      items_count: 30,
      name: "Salads",
      image: "assets/food_image/Salad.png",
    ),
    ItemModel(
        items_count: 30,
        name: "Desserts",
        image: "assets/food_image/desert.png"),
    ItemModel(
      items_count: 44,
      name: "Pasta",
      image: "assets/food_image/pasta.png",
    ),
    ItemModel(
      items_count: 30,
      name: "Beverages",
      image: "assets/food_image/beverages.png",
    ),
  ];
  List<ItemModel> SaladMenu = [
    ItemModel(
      items_count: 25,
      name: "Pizza",
      image: "assets/salad_image/pulav.png",
    ),
    ItemModel(
      items_count: 30,
      name: "Salads",
      image: "assets/salad_image/chopped_salad.png",
    ),
    ItemModel(
        items_count: 30,
        name: "Desserts",
        image: "assets/salad_image/turkey.jpg"),
  ];
  List<ItemModel> PizzaMenu = [
    ItemModel(
      items_count: 25,
      name: "Pizza",
      image: "assets/salad_image/pulav.png",
    ),
    ItemModel(
      items_count: 30,
      name: "Salads",
      image: "assets/salad_image/chopped_salad.png",
    ),
    ItemModel(
        items_count: 30,
        name: "Desserts",
        image: "assets/salad_image/turkey.jpg"),
  ];
}
