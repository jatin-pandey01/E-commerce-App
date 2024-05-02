import 'package:ecommerce_app/models/constant.dart';
import 'package:ecommerce_app/screens/cart/cart_screen.dart';
import 'package:ecommerce_app/screens/favorite/favorite.dart';
import 'package:ecommerce_app/screens/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 1;
  List screens = const [
    // Scaffold(),
    Favorite(),
    HomeScreen(),
    CartScreen(),
    // Scaffold(),
  ];
  @override
  Widget build(BuildContext context) {
    bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0.0;
    
    return Scaffold(
      // floatingActionButton: isKeyboardOpen ? null : FloatingActionButton(
      //   onPressed: (){
      //     setState(() {
      //       currentIndex = 2;
      //     });
      //   },
      //   shape: const CircleBorder(),
      //   backgroundColor: primaryColor,
      //   child: const Icon(
      //     Icons.home,
      //     color: Colors.white,
      //     size: 35,
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        // shadowColor: Colors.blueAccent,
        elevation: 1,
        height: 80,
        color: Colors.grey.shade200,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          // color: Colors.blueAccent,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // IconButton(
              //   onPressed: (){
              //     setState(() {
              //       currentIndex = 0;
              //     });
              //   }, 
              //   icon: Icon(
              //     Icons.grid_view_outlined,
              //     size: 30,
              //     color: currentIndex == 0 ? primaryColor : Colors.grey.shade400,
              //   ),
              // ),
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                decoration:BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex == 0 ? primaryColor : null,
                ),
                child: IconButton(
                  onPressed: (){
                    setState(() {
                      currentIndex = 0;
                    });
                  }, 
                  icon: Icon(
                    Icons.favorite_border,
                    size: 30,
                    color: currentIndex == 0 ? Colors.white : Colors.black,
                  ),
                ),
              ),
              // const SizedBox(width: 15,),
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                decoration:BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex == 1 ? primaryColor : null,
                ),
                child: IconButton(
                  onPressed: (){
                    setState(() {
                      currentIndex = 1;
                    });
                  }, 
                  icon: Icon(
                    Icons.home,
                    size: 30,
                    color: currentIndex == 1 ? Colors.white : Colors.black,
                  ),
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                decoration:BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex == 2 ? primaryColor : null,
                ),
                child: IconButton(
                  onPressed: (){
                    setState(() {
                      currentIndex = 2;
                    });
                  }, 
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    size: 30,
                    color: currentIndex == 2 ? Colors.white : Colors.black,
                  ),
                ),
              ),
              // IconButton(
              //   onPressed: (){
              //     setState(() {
              //       currentIndex = 4;
              //     });
              //   }, 
              //   icon: Icon(
              //     Icons.person,
              //     size: 30,
              //     color: currentIndex == 4 ? primaryColor : Colors.grey.shade400,
              //   ),
              // ),
            ],
          ),
        ),
      ),
      body: screens[currentIndex],
    );
  }
}