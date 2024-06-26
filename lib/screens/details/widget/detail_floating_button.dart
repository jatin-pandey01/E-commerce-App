import 'package:ecommerce_app/models/constant.dart';
import 'package:ecommerce_app/models/shopping_items.dart';
import 'package:ecommerce_app/provider/cart_provider.dart';
import 'package:flutter/material.dart';

class DetailFloatingButton extends StatefulWidget {
  final Product product;
  const DetailFloatingButton({super.key, required this.product});

  @override
  State<DetailFloatingButton> createState() => _DetailFloatingButtonState();
}

class _DetailFloatingButtonState extends State<DetailFloatingButton> {
  int currentCart = 1;
  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    return Container(
      width: currentCart <= 9 ? MediaQuery.of(context).size.width/1.1 : (currentCart <= 99 ? MediaQuery.of(context).size.width/1.07 : MediaQuery.of(context).size.width/1.02),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.only(bottom: 10),
      height: 85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.black87,
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.white),
              borderRadius: BorderRadius.circular(50)
            ),
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: [
                IconButton(
                  onPressed: (){
                    setState(() {
                      if(currentCart > 1){
                        currentCart--;
                      }
                    });
                  }, 
                  icon: const Icon(
                    Icons.remove,
                    color: Colors.white,
                    size: 25,
                  )
                ),
                const SizedBox(width: 10,),
                Text(
                  currentCart.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w600
                  ),
                ),
                const SizedBox(width: 10,),
                IconButton(
                  onPressed: (){
                    setState(() {
                      currentCart++;
                    });
                  }, 
                  icon: const Icon(
                    Icons.add,
                    size: 25,
                    color: Colors.white,
                  )
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(50),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: TextButton(
              onPressed: (){
                setState(() {
                  provider.toggleFavorite(widget.product,currentCart);
                });
                const snackBar = SnackBar(
                  content: Text(
                    "Successfully Added",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white
                    ),
                  ),
                  duration: Duration(milliseconds: 80),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: const Text(
                "Add to Cart",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600
                ),
              )
            ),
          )
        ],
      ),
    );
  }
}