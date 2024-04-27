import 'package:flutter/material.dart';

class DetailAppBar extends StatelessWidget {
  const DetailAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.all(10),
            ),
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              size: 25,
            )
          ),
          Row(
            children: [
              IconButton(
                onPressed: (){}, 
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.all(10),
                ),
                icon: const Icon(
                  Icons.share_outlined,
                  size: 25,
                )
              ),
              const SizedBox(width: 10,),

              IconButton(
                onPressed: (){}, 
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.all(10),
                ),
                icon: const Icon(
                  Icons.favorite_border_outlined,
                  size: 25,
                )
              )
            ],
          )
        ],
      ),
    );
  }
}