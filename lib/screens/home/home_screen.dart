import 'package:ecommerce_app/screens/home/widget/home_app_bar.dart';
import 'package:ecommerce_app/screens/home/widget/home_category.dart';
import 'package:ecommerce_app/screens/home/widget/home_image_slider.dart';
import 'package:ecommerce_app/models/shopping_items.dart';
import 'package:ecommerce_app/screens/home/widget/home_product.dart';
import 'package:ecommerce_app/screens/home/widget/home_search_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSlide = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //For App Bar
              const HomeAppBar(),
              const SizedBox(height: 20,),
          
              //For Search Bar
              const HomeSearchBar(),
              const SizedBox(height: 20,),
          
              //For Slider
              HomeImageSlider(
                currentSlide: currentSlide, 
                onChange:   (value){
                setState(() {
                  currentSlide = value;
                });
                },
              ),
              const SizedBox(height: 20,),
          
              //For category Section
              const HomeCategory(),
              // SizedBox(height: 20,),
          
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Special For You", 
                      style: TextStyle(
                        // color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black54
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
          
              //For Shopping Items
              Padding(
                padding: const EdgeInsets.only(left: 20.0,right: 20, bottom: 20),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.78,
                    crossAxisSpacing: 20, 
                    mainAxisSpacing: 20
                  ), 
                  itemCount: all.length,
                  itemBuilder: (context,index){
                    return HomeProduct(product: all[index]);
                  }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

