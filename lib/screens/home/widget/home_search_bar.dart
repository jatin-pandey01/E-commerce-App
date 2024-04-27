import 'package:ecommerce_app/models/constant.dart';
import 'package:flutter/material.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: contentColor
      ),
      padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 5),
      child: Row(
        children: [
          const Icon(Icons.search,color: Colors.grey,size: 30,),
          const SizedBox(width: 10,),
          const Flexible(
            flex: 2,
            child: TextField(
              style: TextStyle(
                fontSize: 18,
              ),
              decoration: InputDecoration(
                hintText: "Search....",
                border: InputBorder.none,
                hintStyle: TextStyle(
                  fontSize: 18
                ),
              ),
            )
          ),
          SizedBox(width: 5,),
          Container(
            height: 25,
            width: 1.5,
            decoration: const BoxDecoration(
              color: Colors.grey
            ),
          ),
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.tune_outlined, color: Colors.grey,)
          )
        ],
      ),
    );
  }
}