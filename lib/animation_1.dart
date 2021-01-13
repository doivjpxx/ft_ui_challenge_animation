import 'package:flutter/material.dart';

// Positioned Animation

class MyAnimation1 extends StatefulWidget {
  @override
  _MyAnimation1State createState() => _MyAnimation1State();
}

class _MyAnimation1State extends State<MyAnimation1> {
  ScrollController _scrollController = ScrollController();
  Color appBarBackground;
  double topPosition;
  @override
  void initState() {
    topPosition = -80;
    appBarBackground = Colors.transparent;
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  _onScroll() {
    if (_scrollController.offset > 50) {
      if (topPosition < 0)
        setState(() {
          topPosition = -130 + _scrollController.offset;
          if (_scrollController.offset > 130) topPosition = 0;
        });
    } else {
      if (topPosition > -80)
        setState(() {
          topPosition--;
          if (_scrollController.offset <= 0) topPosition = -80;
        });
    }
  }

  double _getOpacity() {
    double op = (topPosition + 80) / 80;
    return op > 1 || op < 0 ? 1 : op;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 190.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30.0))),
                    padding: const EdgeInsets.only(left: 16.0, right: 50.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 70.0,
                        ),
                        Text(
                          "Awesome and simple app bar hiding animation",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24.0),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "AWESOME",
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  Container(
                    height: 300,
                    color: Colors.orange,
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    height: 300,
                    color: Colors.red,
                  ),
                  const SizedBox(height: 30.0),
                  Container(
                    height: 300,
                    color: Colors.yellow,
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    height: 300,
                    color: Colors.pink,
                  ),
                  const SizedBox(height: 10.0),
                ],
              ),
            ),
            Positioned(
              top: topPosition,
              left: 0,
              right: 0,
              child: Container(
                height: 80.0,
                padding:
                    const EdgeInsets.only(left: 50, top: 25.0, right: 20.0),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(_getOpacity()),
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(30.0))),
                child: DefaultTextStyle(
                  style: TextStyle(),
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  child: Semantics(
                    child: Text(
                      'Awesome and simple app bar hiding animation',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                    header: true,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 80.0,
              child: AppBar(
                iconTheme: IconThemeData(color: Colors.black),
                elevation: 0,
                backgroundColor: Colors.transparent,
              ),
            )
          ],
        ));
  }
}
