import 'package:flutter/material.dart';

List<String> places = [
  "Nuwakot",
  "Dhaulagiri",
  "Rara",
  "Muktinath",
  "Pashupatinath"
];

class MyAnimation5 extends StatefulWidget {
  @override
  _MyAnimation5State createState() => _MyAnimation5State();
}

class _MyAnimation5State extends State<MyAnimation5> {
  List<String> items;
  GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    items = ["Kathmandu", "Bhaktapur", "Pokhara", "Mount Everest"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated List'),
        centerTitle: true,
        backgroundColor: Colors.brown[400],
      ),
      backgroundColor: Colors.grey.shade300,
      body: AnimatedList(
        key: _listKey,
        initialItemCount: items.length,
        itemBuilder: (context, index, animate) {
          return SlideTransition(
              position: Tween<Offset>(begin: Offset(1, 0), end: Offset.zero)
                  .animate(animate),
              child: BorderedContainer(
                margin:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                padding: const EdgeInsets.all(0),
                child: ListTile(
                  title: Text(items[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      _listKey.currentState.removeItem(index,
                          (context, animation) {
                        String removedItem = items.removeAt(index);
                        return SizeTransition(
                          sizeFactor: animation,
                          axis: Axis.vertical,
                          child: BorderedContainer(
                            margin: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 8.0),
                            padding: const EdgeInsets.all(0),
                            child: ListTile(
                              title: Text(removedItem),
                            ),
                          ),
                        );
                      });
                      setState(() {});
                    },
                  ),
                ),
              ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          places.shuffle(); // random
          items.insert(items.length, places[0]); // push item to array
          _listKey.currentState.insertItem(items.length - 1);
          setState(() {});
        },
      ),
    );
  }
}

class BorderedContainer extends StatelessWidget {
  final String title;
  final Widget child;
  final double height;
  final double width;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Color color;
  final double elevation;

  const BorderedContainer({
    Key key,
    this.title,
    this.child,
    this.height,
    this.padding,
    this.margin,
    this.color,
    this.width = double.infinity,
    this.elevation = 0.5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      color: color,
      margin: margin ?? const EdgeInsets.all(0),
      child: Container(
        padding: padding ?? const EdgeInsets.all(16.0),
        width: width,
        height: height,
        child: title == null
            ? child
            : Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 28.0)),
                  if (child != null) ...[
                    const SizedBox(
                      height: 10.0,
                    ),
                    child
                  ]
                ],
              ),
      ),
    );
  }
}
