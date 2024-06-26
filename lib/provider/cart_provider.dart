import 'package:ecommerce_app/models/shopping_items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier{

  final List<Product> _cart = [];
  
  List<Product> get cart => _cart;

  void toggleFavorite(Product product, int quantity){
    if(_cart.contains(product)){
      for(Product element in _cart){
        if(element == product){
          element.quantity += quantity;
        }
      }
    }
    else{
      product.quantity = quantity;
      _cart.add(product);
    }
    notifyListeners();
  }

  double totalPrice(){
    double total = 0.0;
    for(Product e in _cart){
      total += (e.price* e.quantity);
    }
    return total;
  }

  static CartProvider of(BuildContext context,{bool listen = true,}){
    return Provider.of<CartProvider>(
      context, 
      listen: listen
    );
  }
}