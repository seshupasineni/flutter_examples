import 'package:flutter/material.dart';

import '../drawer.dart';

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  var _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
      ),
      drawer: BuildDrawer(),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Button pressed $_count times"),
          FlatButton(
            child: Text(
              "Reset",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            onPressed: () => {
              setState(() {
                _count = 0;
              })
            },
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            _count += 1;
          });
        },
      ),
    );
  }
}
