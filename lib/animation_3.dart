import 'package:bottomreveal/bottomreveal.dart';
import 'package:flutter/material.dart';

class MyAnimation3 extends StatefulWidget {
  @override
  _MyAnimation3State createState() => _MyAnimation3State();
}

class _MyAnimation3State extends State<MyAnimation3> {
  final BottomRevealController _menuController = BottomRevealController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        title: Text('Bottom Reveal'),
      ),
      body: BottomReveal(
        openIcon: Icons.add,
        closeIcon: Icons.close,
        revealWidth: 100,
        revealHeight: 100,
        backColor: Color(0xff2D0C3F),
        frontColor: Colors.grey.shade200,
        rightContent: Container(child: _buildRightMenu()),
        bottomContent: Container(child: _buildBottomContent()),
        controller: _menuController,
        body: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemBuilder: (_, index) => Card(
            child: ListTile(
              title: Text("Item $index"),
              leading: Icon(Icons.cloud_circle),
            ),
          ),
        ),
      ),
    );
  }
}

extension MoreMyAnimation3 on _MyAnimation3State {
  TextField _buildBottomContent() {
    return TextField(
      style: TextStyle(color: Colors.white, fontSize: 18.0),
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey,
          contentPadding: const EdgeInsets.all(16.0),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          focusedBorder: OutlineInputBorder(
              gapPadding: 8.0,
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(30.0))),
    );
  }

  Column _buildRightMenu() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        MaterialButton(
          height: 60.0,
          padding: const EdgeInsets.all(0),
          textColor: Colors.white,
          minWidth: 60,
          child: Icon(
            Icons.video_library,
            size: 50,
          ),
          color: Color(0xff644B77),
          elevation: 0,
          onPressed: () {
            _menuController.close();
          },
        ),
        const SizedBox(height: 10.0),
        MaterialButton(
          height: 60.0,
          padding: const EdgeInsets.all(0),
          textColor: Colors.white,
          minWidth: 60,
          child: Icon(
            Icons.photo,
            size: 50,
          ),
          color: Color(0xff644B77),
          elevation: 0,
          onPressed: () {
            _menuController.close();
          },
        ),
        const SizedBox(height: 10.0),
        MaterialButton(
          height: 60.0,
          padding: const EdgeInsets.all(0),
          textColor: Colors.white,
          minWidth: 60,
          child: Icon(
            Icons.camera_alt,
            size: 30,
          ),
          color: Color(0xff644B77),
          elevation: 0,
          onPressed: () {
            _menuController.close();
          },
        ),
        SizedBox(
          height: 20.0,
        )
      ],
    );
  }
}
