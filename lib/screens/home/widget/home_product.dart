import 'package:ecommerce_app/models/constant.dart';
import 'package:ecommerce_app/models/shopping_items.dart';
import 'package:ecommerce_app/provider/favorite_provider.dart';
import 'package:ecommerce_app/screens/details/detail_screen.dart';
import 'package:flutter/material.dart';

class HomeProduct extends StatefulWidget {
  final Product product;
  const HomeProduct({super.key, required this.product});

  @override
  State<HomeProduct> createState() => _HomeProductState();
}

class _HomeProductState extends State<HomeProduct> {
  int currentColor = 0;

  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(product: widget.product,)));
        setState(() {
          
        });
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: contentColor
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10,),
                Hero(
                  tag: widget.product.image,
                  child: Center(
                    child: Image.asset(
                      widget.product.image,
                      fit: BoxFit.cover,
                      width: 140,
                      height: 140,
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 10,),
                  child: Text(
                    widget.product.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                // SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("\u{20B9}${widget.product.price}"),
                    Row(
                      children: [
                        ...List.generate(
                          widget.product.colors.length, 
                          (index) => GestureDetector(
                            onTap: () {
                              setState((){
                                currentColor = index;
                                print(currentColor);
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(
                                milliseconds: 300
                              ),
                              width: currentColor == index ? 20 : 16,
                              height: currentColor == index ? 20 : 16,
                              margin: const EdgeInsets.only(right: 4),
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: widget.product.colors[index],
                                border: Border.all(
                                  width: currentColor == index ? 2 : 0, color: currentColor == index ? Colors.grey.shade400 : Colors.transparent)
                              ),
                            ),
                          )
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),

          //For favorite
          Positioned(
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(5)
                  ),
                  color: primaryColor
                ),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      provider.toggleFavorite(widget.product);
                      print(provider.favorites.length);
                      print("object");
                    });
                  },
                  child: provider.isExist(widget.product) ? 
                  const Icon(
                    Icons.favorite, 
                    color: Colors.white,
                    size: 30,
                  ) :
                  const Icon(
                    Icons.favorite_border, 
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}