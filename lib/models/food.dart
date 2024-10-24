//food item
class Food {
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final FoodCategory category;
  List<Addon> availableAddons;

  Food({
    required this.name,           // chhese burget
    required this.description,    // a burhger full
    required this.imagePath,      // lib/images/cheese_burger.png
    required this.price,          //4.99
    required this.category,       // burger
    required this.availableAddons, // [exrta cheese, sauce, extra patty ]
  });
}

// food categories
enum FoodCategory{
  coffee,
  tea,
  smoothies,
  bubbleTea,
  otherDrinks,
}


//food addons
class Addon {
  String name;
  double price;

  Addon({
    required this.name, 
    required this.price
  });
}