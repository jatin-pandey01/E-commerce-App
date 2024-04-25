import 'package:ecommerce_app/models/constant.dart';
import 'package:ecommerce_app/models/shopping_items.dart';
import 'package:ecommerce_app/screens/details/detail_screen.dart';
import 'package:flutter/material.dart';

class HomeProduct extends StatefulWidget {
  final Product product;
  HomeProduct({super.key, required this.product});

  @override
  State<HomeProduct> createState() => _HomeProductState();
}

class _HomeProductState extends State<HomeProduct> {
  int currentColor = 0;

  @override
  Widget build(BuildContext context) {
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
                SizedBox(height: 15,),
                Center(
                  child: Image.asset(
                    widget.product.image,
                    fit: BoxFit.cover,
                    width: 130,
                    height: 130,
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: EdgeInsets.only(left: 10,),
                  child: Text(
                    widget.product.title,
                    style: TextStyle(
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
                              duration: Duration(
                                milliseconds: 300
                              ),
                              width: currentColor == index ? 20 : 16,
                              height: currentColor == index ? 20 : 16,
                              margin: EdgeInsets.only(right: 4),
                              padding: EdgeInsets.all(2),
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
          )
        ],
      ),
    );
  }
}