import 'package:ecommerce_app/models/shopping_items.dart';
import 'package:ecommerce_app/provider/favorite_provider.dart';
import 'package:flutter/material.dart';

class DetailAppBar extends StatefulWidget {
  final Product product;
  const DetailAppBar({super.key, required this.product});

  @override
  State<DetailAppBar> createState() => _DetailAppBarState();
}

class _DetailAppBarState extends State<DetailAppBar> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
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
                onPressed: (){
                  provider.toggleFavorite(widget.product);
                  setState(() {
                    
                  });
                }, 
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.all(10),
                ),
                icon: provider.isExist(widget.product) ? 
                  const Icon(
                    Icons.favorite, 
                    color: Colors.red,
                    size: 30,
                  ) :
                  const Icon(
                    Icons.favorite_border, 
                    color: Colors.black,
                    size: 30,
                  ),
              )
            ],
          )
        ],
      ),
    );
  }
}