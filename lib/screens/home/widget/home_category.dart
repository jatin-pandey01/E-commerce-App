import 'package:ecommerce_app/models/category.dart';
import 'package:flutter/material.dart';

class HomeCategory extends StatelessWidget {
  const HomeCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 130,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context,index){
            return Column(
              children: [
                Container(
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(categories[index].image),
                      fit: BoxFit.cover,
                    )
                  ),
                ),
                const SizedBox(height: 5,),
                Text(
                  categories[index].title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            );
          },
          separatorBuilder: (context,index) => const SizedBox(width: 20,),
        ),
      ),
    );
  }
}