class ItemModel {
  final int items_count;
  final String name;
  final String image;

  ItemModel({
    required this.items_count,
    required this.name,
    required this.image,
  });
}

class ItemList {
  final List allFoodList;

  ItemList({required this.allFoodList});
}
