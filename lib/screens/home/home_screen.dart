import 'package:ecommerce_app/models/constant.dart';
import 'package:ecommerce_app/screens/details/detail_screen.dart';
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
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //For App Bar
                HomeAppBar(),
                SizedBox(height: 20,),

                //For Search Bar
                HomeSearchBar(),
                SizedBox(height: 20,),

                //For Slider
                HomeImageSlider(
                  currentSlide: currentSlide, 
                  onChange:   (value){
                  setState(() {
                    currentSlide = value;
                  });
                  },
                ),
                SizedBox(height: 20,),

                //For category Section
                HomeCategory(),
                // SizedBox(height: 20,),

                const Row(
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
                SizedBox(height: 10,),

                //For Shopping Items
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.82,
                    crossAxisSpacing: 20, 
                    mainAxisSpacing: 20
                  ), 
                  itemCount: all.length,
                  itemBuilder: (context,index){
                    return HomeProduct(product: all[index]);
                  }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

