import 'package:flutter/material.dart';

import './todo/todoList.dart';

void main() => runApp(Demo());

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        buttonColor: Colors.green,
      ),
      home: TodoList(),
      debugShowCheckedModeBanner: false,
    );
  }
}