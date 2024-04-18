import 'package:flutter/foundation.dart';

class Category{
  final String title;
  final String image;
  Category({required this.title,required this.image});
}

final List<Category> categories = [
  Category(title: "Shoes", image: "images/shoes.png"),
  Category(title: "Beauty", image: "images/beauty.png"),
  Category(title: "Women's\nFashion", image: "images/image1.png"),
  Category(title: "Jewellery", image: "images/jewellery.png"),
  Category(title: "Men's\nFashion", image: "images/men.png"),
];