import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return ListTile(
            title: _buildText(index),
            onTap: () => _routeChange(context, index),
          );
        },
      ),
    );
  }

  Text _buildText(int index) {
    var _title = '';
    switch (index) {
      case 0:
        _title = 'Positioned Navbar';
        break;
      case 1:
        _title = 'Hero Animation';
        break;
      default:
        break;
    }
    return Text(_title);
  }

  _routeChange(BuildContext context, int index) {
    if (index == 0) {
      return Navigator.pushNamed(context, '/first');
    } else if (index == 1) {
      return Navigator.pushNamed(context, '/second');
    }
  }
}
