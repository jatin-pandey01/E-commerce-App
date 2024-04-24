import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailImageSlider extends StatefulWidget {
  final String image;
  final Function (int) onChange;
  const DetailImageSlider({super.key, required this.image, required this.onChange});

  @override
  State<DetailImageSlider> createState() => _DetailImageSliderState();
}

class _DetailImageSliderState extends State<DetailImageSlider> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 250,
          child: PageView(
            allowImplicitScrolling: true,
            onPageChanged: widget.onChange,
            scrollDirection: Axis.horizontal,
            physics: ClampingScrollPhysics(),
            children: [
              Image.asset(widget.image),
              Image.asset(widget.image),
              Image.asset(widget.image),
            ],
          ),
        ),
              
      ],
    );
  }
}