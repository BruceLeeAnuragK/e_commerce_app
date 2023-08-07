import 'package:e_commerce_app/model/Item_model.dart';
import 'package:flutter/cupertino.dart';

class ItemProvider extends ChangeNotifier {
  double h = 100;
  double w = 250;

  changerotating() {
    notifyListeners();
  }

  changeSize({required double sizeh, required double sizew}) {
    h = sizeh;
    w = sizew;
    notifyListeners();
  }

  List AllMenu = [
    [
      ItemModel(
        items_count: 25,
        name: "Margherita",
        image: "assets/salad_image/margherita_pizza.png",
      ),
      ItemModel(
        items_count: 30,
        name: "pepperoni_pizza",
        image: "assets/salad_image/pepperoni_pizza.png",
      ),
      ItemModel(
          items_count: 30,
          name: "Desserts",
          image: "assets/salad_image/shushi_pizza.jpg"),
    ],
    [
      ItemModel(
        items_count: 25,
        name: "Rice with many vegetables",
        image: "assets/salad_image/pulav.png",
      ),
      ItemModel(
        items_count: 30,
        name: "Chopped Salad",
        image: "assets/salad_image/chopped_salad.png",
      ),
      ItemModel(
          items_count: 30,
          name: "Turkey Salad",
          image: "assets/salad_image/turkey.jpg"),
    ],
    [
      ItemModel(
        items_count: 25,
        name: "Chocolate Cake",
        image: "assets/salad_image/chocolate_cake.png",
      ),
      ItemModel(
        items_count: 30,
        name: "Browny Cake",
        image: "assets/salad_image/browny_cake.png",
      ),
      ItemModel(
          items_count: 30,
          name: "Puddings",
          image: "assets/salad_image/pudding.png"),
    ],
    [
      ItemModel(
        items_count: 25,
        name: "Lasagna Pasta",
        image: "assets/salad_image/lasagna.png",
      ),
      ItemModel(
        items_count: 30,
        name: "Penne Pasta",
        image: "assets/salad_image/penne.png",
      ),
      ItemModel(
          items_count: 30,
          name: "Spaghetti",
          image: "assets/salad_image/spaghetti.png"),
    ],
    [
      ItemModel(
        items_count: 25,
        name: "Blueberry Beverage ",
        image: "assets/salad_image/blueberry.png",
      ),
      ItemModel(
        items_count: 30,
        name: "Orange Juice",
        image: "assets/salad_image/orange_juice.png",
      ),
      ItemModel(
          items_count: 30,
          name: "Strawberry Juice",
          image: "assets/salad_image/strawberry_juice.png"),
    ],
  ];

  List myMenu = [
    {
      "Item": [
        {
          "items_count": 25,
          "name": "Margherita",
          "image": "assets/pizza_image/margherita_pizza.png",
        },
        {
          "items_count": 30,
          "name": "pepperoni_pizza",
          "image": "assets/pizza_image/pepperoni_pizza.png",
        },
        {
          "items_count": 30,
          "name": "Desserts",
          "image": "assets/pizza_image/shushi_pizza.png",
        }
      ]
    },
    {
      "Item": [
        {
          "items_count": 25,
          "name": "Rice with\nmany vegetables",
          "image": "assets/salad_image/pulav.png",
        },
        {
          "items_count": 30,
          "name": "Chopped Salad",
          "image": "assets/salad_image/chopped_salad.png",
        },
        {
          "items_count": 30,
          "name": "Turkey Salad",
          "image": "assets/salad_image/turkey.jpg",
        }
      ]
    },
    {
      "Item": [
        {
          "items_count": 25,
          "name": "Chocolate Cake",
          "image": "assets/desserts_image/chocolate_cake.png",
        },
        {
          "items_count": 30,
          "name": "Browny Cake",
          "image": "assets/desserts_image/browny_cake.png",
        },
        {
          "items_count": 30,
          "name": "Puddings",
          "image": "assets/desserts_image/pudding.png"
        }
      ]
    },
    {
      "Item": [
        {
          "items_count": 25,
          "name": "Lasagna Pasta",
          "image": "assets/pasta_image/lasagna.png",
        },
        {
          "items_count": 30,
          "name": "Penne Pasta",
          "image": "assets/pasta_image/penne.png",
        },
        {
          "items_count": 30,
          "name": "Spaghetti",
          "image": "assets/pasta_image/spaghetti.png"
        }
      ]
    },
    {
      "Item": [
        {
          "items_count": 25,
          "name": "Blueberry Beverage ",
          "image": "assets/beverages_image/blueberry.png",
        },
        {
          "items_count": 30,
          "name": "Orange Juice",
          "image": "assets/beverages_image/orange_juice.png",
        },
        {
          "items_count": 30,
          "name": "Strawberry Juice",
          "image": "assets/beverages_image/strawberry_juice.png"
        }
      ]
    },
  ];
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
}
