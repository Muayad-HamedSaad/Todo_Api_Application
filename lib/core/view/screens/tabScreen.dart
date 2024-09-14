import 'package:flutter/material.dart';
import 'package:todos_api/core/view/screens/random_todo-screen.dart';
import 'package:todos_api/core/view/screens/random_todo_number_screen.dart';
import 'package:todos_api/core/view/screens/single_todo_screen.dart';
import 'package:todos_api/core/view/screens/todos_screen.dart';
import 'package:todos_api/core/view/screens/uncomplete_todo_screen.dart';

import 'complete_todo_screen.dart';
import 'limt_skip_todos_screen.dart';

class Tabs extends StatelessWidget {
  const Tabs({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 7, child: Scaffold(
      appBar: AppBar(title: Text("Todos Application"),
        backgroundColor: Color(0xFF0AA89E),
        bottom: TabBar(
            isScrollable: true,
            indicatorColor: Color(0xFF0AA89E),
            unselectedLabelColor: Colors.white,
            labelColor: Colors.black,
            tabs: [
          Center(child: Text("All Todos")),
          Center(child: Text("Complet Todos")),
          Center(child: Text("UnComplete Todos")),
          Center(child: Text("Single Todo")),
          Center(child: Text("Random Todo")),
          Center(child: Text("Random Todos By Num")),
          Center(child: Text("Limit_Skip Todos")),
        ])
        ,),
      body:TabBarView(children:[
        TodosScreen(),
        CompleteTodoScreen(),
        UncompleteTodoScreen(),
        SingleTodoScreen(),
        RandomTodoScreen(),
        RandomTodoNumberScreen(),
        LimtSkipTodosScreen(),
      ]),
    ));;
  }
}