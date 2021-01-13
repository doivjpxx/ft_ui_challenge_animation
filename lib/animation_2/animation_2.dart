import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:ui_challenge_animation/constants/assets.dart' as assets;
import 'package:ui_challenge_animation/widgets/network_image.dart';

// Hero Animation

List<String> images = [
  assets.images[0],
  assets.images[1],
  assets.images[2],
];

const List<Map> dummy = [
  {"title": "Beautiful Cardigan", "price": "\$600"},
  {"title": "Leather Bag", "price": "\$400"},
  {"title": "White Beautiful Bag", "price": "\$350"},
];

class MyAnimation2 extends StatefulWidget {
  static final String path =
      "lib/src/pages/animations/animation1/animation1.dart";

  @override
  _MyAnimation2State createState() => _MyAnimation2State();
}

class _MyAnimation2State extends State<MyAnimation2> {
  int currentIndex = 0;
  int prevIndex = 0;
  final SwiperController _swiperController = SwiperController();
  AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: Icon(
                  Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          Text.rich(TextSpan(children: <TextSpan>[
            TextSpan(
                text: "Best items",
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: " from around"),
          ])),
          Expanded(
            flex: 2,
            child: Swiper(
              physics: BouncingScrollPhysics(),
              loop: false,
              viewportFraction: 0.8, // get 1/3 next item
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: Hero(
                            tag: "image$index",
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x54000000),
                                    spreadRadius: 5,
                                    blurRadius: 12,
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: PNetworkImage(
                                  images[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Stack(
            children: <Widget>[
              AnimatedOpacity(
                opacity: currentIndex == 0 ? 1 : 0,
                child: Text('hEEE'),
                duration: Duration(seconds: 1),
              ),
            ],
          )
        ],
      ),
    );
  }

// TODO: implement here !!!
  Widget _buildDesc(int index) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Hero(
            tag: "title$index",
            child: Material(
              type: MaterialType.transparency,
            ),
          ),
        ],
      ),
    );
  }
}
