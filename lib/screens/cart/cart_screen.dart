
import 'dart:ffi';

import 'package:ecommerce_app/models/constant.dart';
import 'package:ecommerce_app/provider/cart_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    final finalList = provider.cart;
    final totalPrice = provider.totalPrice();
    return Scaffold(
      bottomSheet: Container(
        height: 300,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))
        ),
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Column(
          children: [
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width/1,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: contentColor,
                borderRadius: BorderRadius.circular(50)
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: TextField(
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold
                      ),
                      decoration: InputDecoration(
                        hintText: "Enter Discount code",
                        hintStyle: TextStyle(
                          color: Colors.black54,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                        border: InputBorder.none
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Text(
                    "Apply",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              )
            ),
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Subtotal : ",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),
                ),
                Text(
                  '\u{20B9} ${totalPrice.toString()}',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 20
                  ),
                )
              ],
            ),
            SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 2,
              decoration: BoxDecoration(
                color: contentColor
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Total : ",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                ),
                Text(
                  '\u{20B9} ${totalPrice.toString()}',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 20
                  ),
                ),
              ],
            ),
            SizedBox(height: 30,),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(50)
                ),
                child: Center(
                  child: Text(
                    "Checkout",
                    style: TextStyle(
                      color: totalPrice > 1 ? Colors.white : Colors.grey.shade400,
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ),
            )
          ],
        ),
      ),
      backgroundColor: contentColor,
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Center(
                child: Text(
                  "My Cart",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                  ),
                ),
              ),
            ),
            finalList.length == 0 ? 
            Container(
              height: MediaQuery.of(context).size.height*0.6,
              child: Center(
                child: Text("No Cart Items here !!!"),
              ),
            ) :
            Expanded(
              child: ListView.builder(
                itemCount: finalList.length,
                itemBuilder: (context,index){
                  final cartItems = finalList[index];
                  return Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(
                          bottom: 20, 
                          right: 10, 
                          left: 10,
                          top: 5
                        ),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 120,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: contentColor
                              ),
                              padding: EdgeInsets.all(10),
                              child: Image(image: AssetImage(cartItems.image,), fit: BoxFit.cover,),
                            ),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cartItems.title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text(
                                  cartItems.category,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  '\u{20B9} ${cartItems.price * cartItems.quantity}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                )
                              ],
                            ),
                            Spacer(),
                            Container(
                              height: 120,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: (){
                                      setState(() {
                                        finalList.remove(cartItems);
                                        //And for removing index, use finalList.removeAt(index);
                                      });
                                    }, 
                                    icon: Icon(
                                      Icons.delete,
                                      color: primaryColor,
                                    )
                                  ),
                                  SizedBox(height: 20,),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: contentColor,
                                      borderRadius: BorderRadius.circular(40)
                                    ),
                                    // padding: EdgeInsets.all(2),
                                    
                                    child: Row(
                                      children: [
                                        IconButton(
                                          onPressed: (){
                                            setState(() {
                                              if(cartItems.quantity > 1){
                                                cartItems.quantity--;
                                              }
                                            });
                                          }, 
                                          icon: Icon(
                                            Icons.remove,
                                            color: Colors.black,
                                            weight: BorderSide.strokeAlignOutside,
                                            size: 20,
                                          ),
                                        ),
                                        SizedBox(width: 5,),
                                        Text(
                                          '${cartItems.quantity}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18
                                          ),
                                        ),
                                        SizedBox(width: 5,),
                                        IconButton(
                                          onPressed: (){
                                            setState(() {
                                              cartItems.quantity++;
                                            });
                                          }, 
                                          icon: Icon(
                                            Icons.add,
                                            color: Colors.black,
                                            size: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                }
              ),
            )
          ],
        )
      ),
    );
  }
}

// We used the provider state management to show the add to cart items
// when user click on add to cart.
// and same as favorite items