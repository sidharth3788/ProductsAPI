enum Category {
  electronics,
  jewelery,
  mensclothing,
  womenclothing,
}

class ShopItem {
  int id;
  String title;
  double price;
  String description;
  Category category;
  String image;
  Rating rating;

  ShopItem({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });
}

class Rating {
  double rate;
  int count;

  Rating({
    required this.rate,
    required this.count,
  });
}
