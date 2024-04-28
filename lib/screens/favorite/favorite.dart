import 'package:ecommerce_app/models/constant.dart';
import 'package:ecommerce_app/provider/favorite_provider.dart';
import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    final favorites = provider.favorites;
    return Scaffold(
      backgroundColor: contentColor,
      appBar: AppBar(
        title: Text(
          "Favorite Items", 
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: contentColor,
      ),
      body: Column(
        children: [
          favorites.length > 0 ? 
          Expanded(
            child: ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context,index){
                final favItems = favorites[index];
                return Container(
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
                        height: 85,
                        width: 85,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: contentColor
                        ),
                        padding: EdgeInsets.all(10),
                        child: Image(
                          image: AssetImage(favItems.image,), 
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            favItems.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                            ),
                          ),
                          SizedBox(height: 5,),
                          Text(
                            favItems.category,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            '\u{20B9} ${favItems.price}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: (){
                          setState(() {
                            provider.toggleFavorite(favItems);
                          });
                        }, 
                        icon: Icon(
                          Icons.favorite,
                          size: 65,
                          color: Colors.red,
                        )
                      )
                    ],
                  ),
                );
              }
            )
          ) :
          Expanded(
            child: Center(
              child: Text(
                "No Favorite Items !!",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
              )
            )
          )
        ],
      ),
    );
  }
}