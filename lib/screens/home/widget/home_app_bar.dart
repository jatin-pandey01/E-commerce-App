import 'package:ecommerce_app/models/constant.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({ super.key, });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: contentColor, 
              padding: const EdgeInsets.all(20)
            ),
            onPressed: (){}, 
            icon: Image.asset("images/icon.png", height: 20,)
          ),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: contentColor,
              padding: const EdgeInsets.all(15)
            ),
            onPressed: (){}, 
            iconSize: 30,
            icon: const Icon(Icons.notifications_outlined)
          )
        ],
      ),
    );
  }
}