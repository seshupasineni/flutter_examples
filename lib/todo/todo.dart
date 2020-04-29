import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Todo extends StatelessWidget {
  final String title;
  final bool complete;
  final Function markComplete;
  final Function deleteTodo;

  Todo({this.complete, this.title, this.markComplete, this.deleteTodo});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      activeColor: Theme.of(context).buttonColor,
      title: Text(
        title,
        style: complete
            ? TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Theme.of(context).buttonColor)
            : null,
      ),
      value: complete,
      onChanged: (bool value) {
        markComplete(value);
      },
      secondary: IconButton(
        icon: Icon(Icons.remove_circle, color: Colors.red,),
        onPressed: deleteTodo,
      ),
    );
  }
}
