import 'package:ecommerce_app/models/constant.dart';
import 'package:ecommerce_app/models/shopping_items.dart';
import 'package:ecommerce_app/screens/details/detail_app_bar.dart';
import 'package:ecommerce_app/screens/details/detail_image_slider.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final Product product;
  const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int currentSlide = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: contentColor,
      body: SafeArea(
        child: Column(
          children: [
            //App Bar
            DetailAppBar(),
            
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
                  duration: Duration(microseconds: 300),
                  width: currentSlide == index ? 15 : 8,
                  height: 8,
                  margin: EdgeInsets.only(right: 3),
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

            SizedBox(height: 20,),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                color: Colors.white,
              ),
            )
          ],
        )
      ),
    );
  }
}