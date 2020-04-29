import 'package:flutter/material.dart';

import 'counter/counter.dart';
import 'todo/todoList.dart';

class BuildDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            padding: EdgeInsets.only(top: 60),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Text(
              'Demo Application',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          ListTile(
            enabled: true,
            leading: Icon(Icons.add_circle, size: 30,),
            title: Text('Counter'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Counter()),
              );
            },
          ),
          ListTile(
            enabled: true,
            leading: Icon(Icons.check_circle, size: 30,),
            title: Text('Todo List'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TodoList()),
              );
            },
          ),
        ],
      ),
    );
  }
}
