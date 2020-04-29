import 'package:flutter/material.dart';

import './todo.dart';
import '../drawer.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<Map<String, Object>> todos = [];

  String _placeHolderTodo;

  void markTodoComplete(bool complete, todo) {
    setState(() {
      todo['complete'] = complete;
    });
  }

  void deleteTodo(todoToDelete) {
    setState(() {
      todos.removeWhere((todo) => todo['title'] == todoToDelete['title']);
    });
  }

  var pendingTodos = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
        centerTitle: true,
      ),
      drawer: BuildDrawer(),
      body: Center(
        child: todos.length == 0
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Text("Go do something!!")],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: todos.map((todo) {
                  return Todo(
                      complete: todo['complete'],
                      title: todo['title'],
                      markComplete: (complete) =>
                          markTodoComplete(complete, todo),
                      deleteTodo: () => deleteTodo(todo));
                }).toList()),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              child: AlertDialog(
                title: Text("Add todo"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Todo',
                      ),
                      onChanged: ((value) {
                        _placeHolderTodo = value;
                      }),
                    ),
                    SizedBox(
                      width: double.infinity,
                        child: RaisedButton(
                      color: Theme.of(context).buttonColor,
                      onPressed: () {
                        setState(() {
                          todos.add({"title": _placeHolderTodo, "complete": false});
                        });
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Add",
                        style: TextStyle(color: Colors.white),
                      ),
                    ))
                  ],
                ),
              ));
        },
      ),
    );
  }
}
