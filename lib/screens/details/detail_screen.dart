import 'package:ecommerce_app/models/constant.dart';
import 'package:ecommerce_app/models/shopping_items.dart';
import 'package:ecommerce_app/screens/details/widget/detail_app_bar.dart';
import 'package:ecommerce_app/screens/details/widget/detail_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailScreen extends StatefulWidget {
  final Product product;
  const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int currentSlide = 0, currentColor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: contentColor,
      body: SafeArea(
        child: Column(
          children: [
            //App Bar
            const DetailAppBar(),
            
            //Image Slider
            DetailImageSlider(image: widget.product.image,onChange: (value){
              setState(() {
                currentSlide = value;
              });
            },),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => AnimatedContainer(
                  duration: const Duration(microseconds: 300),
                  width: currentSlide == index ? 15 : 8,
                  height: 8,
                  margin: const EdgeInsets.only(right: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: currentSlide == index  ? Colors.black : Colors.transparent,
                    border: Border.all(
                      color:Colors.black 
                    ) 
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20,),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                color: Colors.white,
              ),
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
                bottom: 100,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //For Product name, Price, Rating, and Seller
                  Text(
                    widget.product.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(height: 4,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '\u{20B9}${widget.product.price}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 22,
                            ),
                          ),
                          const SizedBox(height: 4,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 3, right: 5, top: 2, bottom: 2),
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(30)
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.star, 
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                    Text(
                                      '${widget.product.rate}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 6,),
                              Text(
                                widget.product.review,
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                  fontWeight: FontWeight.w400
                                ),
                              )

                            ],
                          )
                        ],
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: "Seller : ", 
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18
                              ),
                            ),
                            TextSpan(
                              text: widget.product.seller,
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 20,
                              )
                            )
                          ]
                        ), 
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Text(
                    "Color", 
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w800
                    ),
                  ),
                  Row(
                    children: [
                      ...List.generate(
                        widget.product.colors.length, 
                        (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              currentColor = index;
                            });
                          },
                          child: AnimatedContainer(
                            width: 50,
                            height: 50,
                            padding: EdgeInsets.all(currentColor == index ? 2 : 5),
                            margin: EdgeInsets.only(right: 10),
                            duration: Duration(milliseconds: 350),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: currentColor == index ? 3 : 0,
                                color: currentColor == index ? Colors.grey.shade400 : Colors.transparent
                              )
                            ),
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: widget.product.colors[index],
                              ),
                            ),
                          ),
                        )
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}