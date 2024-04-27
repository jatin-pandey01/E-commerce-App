import 'package:flutter/material.dart';

class Product{
  final String title;
  final String description;
  final String image;
  final String review;
  final String seller;
  final double price;
  final List<Color> colors;
  final String category ;
  final double rate;
  int quantity;
  bool favorite;

  Product({
    required this.title,
    required this.description,
    required this.image,
    required this.review,
    required this.seller,
    required this.price,
    required this.colors,
    required this.category,
    required this.rate,
    required this.quantity,
    required this.favorite
  });
}


final List<Product> all = [
  Product(
    title : "Ear buds",
    description : "Boat wireless earbuds redefine portable audio, delivering immersive sound in a sleek, tangle-free design. Dive into your favorite tunes with Boat's seamless connectivity and lasting comfort, wherever your adventures take you",
    image : "images/all/wireless.png",
    price : 799,
    seller : "Boat",
    colors : [
      Colors.black,
      Colors.blue,
      Colors.orange,
    ],
    category : "Electronics",
    review : "(320 Reviews)",
    rate : 4.8,
    quantity : 1,
    favorite: false,
  ),
  Product(
    title : "Woman Sweater",
    description : "Elevate your style with the cozy sophistication of a woman's sweater, blending warmth and elegance effortlessly. From classic knits to trendy designs, find the perfect layer to complement any occasion and showcase your unique fashion statement.",
    image : "images/all/sweater.png",
    price : 499,
    seller : "Surat Garment",
    colors : [
      Colors.brown,
      Colors.deepPurple,
      Colors.pink,
    ],
    category : "Woman Fashion",
    review : "(32 Reviews)",
    rate : 4.5,
    quantity : 1,
    favorite: false,
  ),
  Product(
    title : "Smart Watch",
    description : "Titan smartwatches seamlessly blend style and functionality, offering a sophisticated companion for the modern individual. With advanced features like health tracking and customizable interfaces, stay connected and in control while making a bold fashion statement.",
    image : "images/all/miband.jpg",
    price : 1999,
    seller : "Tata Titan",
    colors : [
      Colors.black,
      Colors.amber,
      Colors.purple,
    ],
    category : "Electronics",
    review : "(20 Reviews)",
    rate : 4.0,
    quantity : 1,
    favorite: false,
  ),
  Product(
    title : "Mens Jacket",
    description : "Embrace the rugged yet refined versatility of a men's jacket, crafted to withstand the elements without compromising on style. Whether conquering the urban jungle or exploring the great outdoors, find your perfect blend of comfort, durability, and timeless design.",
    image : "images/all/jacket.png",
    price : 799,
    seller : "Jacket Store",
    colors : [
      Colors.blueAccent,
      Colors.orange,
      Colors.green,
    ],
    category : "Men Fashion",
    review : "(20 Reviews)",
    rate : 5.0,
    quantity : 1,
    favorite: false,
  ),
   Product(
    title : "Watch",
    description : "Analog watches embody timeless elegance, marrying classic craftsmanship with understated sophistication. With their intricate dials and precision movements, they serve not only as timekeeping essentials but also as enduring symbols of style and refinement, effortlessly complementing any ensemble.",
    image : "images/men fashion/watch.png",
    price : 1999,
    seller : "Watch Store",
    colors : [
      Colors.lightBlue,
      Colors.orange,
      Colors.purple,
    ],
    category : "MenFashion",
    review : "(100 Reviews)",
    rate : 5.0,
    quantity : 1,
    favorite: false,
  ),
   Product(
    title : "Air Jordan",
    description : "Step into sophistication and comfort with men's shoes that marry style with functionality. From sleek leather loafers for the boardroom to rugged boots for outdoor adventures, elevate every stride with quality craftsmanship and timeless design.",
    image : "images/shoes/Air Jordan.png",
    price : 999,
    seller : "Jordan Seller",
    colors : [
      Colors.grey,
      Colors.amber,
      Colors.purple,
    ],
    category : "Shoes",
    review : "(55 Reviews)",
    rate : 5.0,
    quantity : 1,
    favorite: false,
  ),
  Product(
    title : "Super Perfume",
    description : "Perfume is more than just a scent; it's an expression of individuality and allure. From floral notes that evoke romance to woody undertones that exude confidence, each fragrance captures a unique essence, leaving a lingering impression that speaks volumes without a word.",
    image : "images/beauty/perfume.png",
    price : 599,
    seller : "Love Seller",
    colors : [
      Colors.purpleAccent,
      Colors.pinkAccent,
      Colors.green,
    ],
    category : "Beauty",
    review : "(99 Reviews)",
    rate : 4.7,
    quantity : 1,
    favorite: false,
  ),
  Product(
    title : "Wedding Ring",
    description : "A wedding ring symbolizes an eternal bond, a circle of love without beginning or end. Crafted with precious metals and often adorned with gems, it encapsulates the promise of a lifetime together, embodying commitment, unity, and enduring devotion.",
    image : "images/jewelry/wedding ring.png",
    price : 19999.00,
    seller : "Kalyan Jeweller",
    colors : [
      Colors.brown,
      Colors.purpleAccent,
      Colors.blueGrey,
    ],
    category : "Jewellery",
    review : "(80 Reviews)",
    rate : 4.5,
    quantity : 1,
    favorite: false,
  ),
  Product(
    title : "Pants",
    description : "Men's pants blend style and functionality seamlessly, offering versatility for every occasion. From tailored trousers exuding professional elegance to rugged denim for casual coolness, find the perfect fit to complement your individuality and stride with confidence wherever you go.",
    image : "images/women fashion/pants.png",
    price : 699.00,
    seller : "PK Store",
    colors : [
      Colors.lightGreen,
      Colors.blueGrey,
      Colors.deepPurple,
    ],
    category : "Men Fashion",
    review : "(55 Reviews)",
    rate : 5.0,
    quantity : 1,
    favorite: false,
  ),
];
