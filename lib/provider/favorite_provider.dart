import 'package:ecommerce_app/models/shopping_items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteProvider extends ChangeNotifier{

  final List<Product> _favorites = [];

  List<Product> get favorites => _favorites;

  void toggleFavorite(Product product, bool fav){
    product.favorite = fav;
    if(fav){
      _favorites.add(product);
    }
    else{
      _favorites.remove(product);
    }
    notifyListeners();
  }

  static FavoriteProvider of(BuildContext context,{bool listen = true}){
    return Provider.of<FavoriteProvider>(
      context,
      listen: listen,
    );
  }

}