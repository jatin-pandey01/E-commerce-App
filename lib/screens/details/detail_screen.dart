import 'package:ecommerce_app/models/constant.dart';
import 'package:ecommerce_app/models/shopping_items.dart';
import 'package:ecommerce_app/screens/details/widget/detail_app_bar.dart';
import 'package:ecommerce_app/screens/details/widget/detail_floating_button.dart';
import 'package:ecommerce_app/screens/details/widget/detail_image_slider.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final Product product;
  const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int currentSlide = 0, currentColor = 0, currentTextSlide = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
    
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //Add to cart button
      floatingActionButton: DetailFloatingButton(product: widget.product),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: contentColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //App Bar
              DetailAppBar(product: widget.product,),
              
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

              //Rest of data
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
                  top: 20,
                  bottom: 100,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //For Product name, Price, Rating, and Seller
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        widget.product.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
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
                    ),
                    const SizedBox(height: 15,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Text(
                        "Color", 
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w800
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
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
                                margin: const EdgeInsets.only(right: 10),
                                duration: const Duration(milliseconds: 350),
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
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                currentTextSlide = 0;
                                _controller.jumpToPage(0);
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(microseconds: 1500),
                              padding: EdgeInsets.symmetric(horizontal: currentTextSlide == 0 ? 15 : 0, vertical: currentTextSlide == 0 ? 7 : 0),
                              decoration: BoxDecoration(
                                color: currentTextSlide == 0 ? primaryColor : null,
                                borderRadius: currentTextSlide == 0 ? BorderRadius.circular(50) : null,
                              ),
                              // alignment: Alignment.bottomCenter,
                              child: Center(
                                child: Text(
                                  "Description",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: currentTextSlide == 0 ? Colors.white : Colors.black,
                                    fontSize: 16
                                  ),
                                )
                              ),
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                currentTextSlide = 1;
                                _controller.jumpToPage(1);
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(microseconds: 1500),
                              padding: EdgeInsets.symmetric(horizontal: currentTextSlide == 1 ? 15 : 0, vertical: currentTextSlide == 1 ? 7 : 0),
                              decoration: BoxDecoration(
                                color: currentTextSlide == 1 ? primaryColor : null,
                                borderRadius: currentTextSlide == 1 ? BorderRadius.circular(20) : null,
                              ),
                              // alignment: Alignment.bottomCenter,
                              child: Center(
                                child: Text(
                                  "Specifications",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: currentTextSlide == 1 ? Colors.white : Colors.black,
                                    fontSize: 16
                                  ),
                                )
                              ),
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                currentTextSlide = 2;
                                _controller.jumpToPage(2);
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(microseconds: 1500),
                              padding: EdgeInsets.symmetric(horizontal: currentTextSlide == 2 ? 15 : 0, vertical: currentTextSlide == 2 ? 7 : 0),
                              decoration: BoxDecoration(
                                color: currentTextSlide == 2 ? primaryColor : null,
                                borderRadius: currentTextSlide == 2 ? BorderRadius.circular(20) : null,
                              ),
                              // alignment: Alignment.bottomCenter,
                              child: Center(
                                child: Text(
                                  "Reviews",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: currentTextSlide == 2 ? Colors.white : Colors.black,
                                  ),
                                )
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    SizedBox(
                      width: double.infinity,
                      height: 270,
                      child: PageView(
                        controller: _controller,
                        allowImplicitScrolling: true,
                        onPageChanged: (value){
                          setState(() {
                            currentTextSlide = value;
                          });
                        },
                        scrollDirection: Axis.horizontal,
                        physics: const ClampingScrollPhysics(),
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              widget.product.description,
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w400
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: const Text(
                              "Seamless shopping at your fingertips, where convenience meets endless choices. Explore, shop, and redefine your online experience with our intuitive e-commerce app.",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 2,
                                      color: contentColor
                                    )
                                  ),
                                  padding: const EdgeInsets.all(2),
                                  child: const CircleAvatar(
                                    backgroundImage: AssetImage(
                                      'images/profile.png'
                                    ),
                                    radius: 25,
                                  ),
                                ),
                                const SizedBox(width: 20,),
                                Container(
                                  width: size.width-100,
                                  margin: const EdgeInsets.only(top: 5),
                                  child: const Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Jatin Pandey",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 16,
                                              color: Colors.black87
                                            ),
                                          ),
                                          // SizedBox(width: 100,),
                                          Text(
                                            "March 24",
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 14
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 5,),
                                      Text(
                                        "Dive into a world of unparalleled shopping convenience with our cutting-edge Flutter-powered e-commerce app. Seamlessly browse through an extensive catalog, enjoy lightning-fast transactions, and redefine your online shopping experience. Experience the future of e-commerce, designed with Flutter's versatility and performance in mind.",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}