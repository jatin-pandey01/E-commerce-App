import 'package:flutter/material.dart';

class HomeImageSlider extends StatelessWidget {

  final Function (int) onChange;
  final int currentSlide;

  const HomeImageSlider({super.key, required this.currentSlide, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 220,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: PageView(
              onPageChanged: onChange,
              scrollDirection: Axis.horizontal,
              allowImplicitScrolling: true,
              physics: ClampingScrollPhysics(),
              children: [
                Image.asset("images/slider.jpg", fit: BoxFit.cover,),
                Image.asset("images/image1.png", fit: BoxFit.cover,),
                Image.asset("images/slider3.png", fit: BoxFit.cover,),
              ],
            ),
          ),
        ),
        Positioned.fill(
          bottom: 10,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3, 
                (index) => AnimatedContainer(
                  duration: Duration(microseconds: 300),
                  width: currentSlide == index ? 15 : 8,
                  height: 8,
                  margin: EdgeInsets.only(right: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: currentSlide == index  ? Colors.black : Colors.transparent,
                    border: Border.all(
                      color:Colors.black 
                    ) 
                  ),
                ),
              ),
            ),
          )
        ),
      ],
    );
  }
}