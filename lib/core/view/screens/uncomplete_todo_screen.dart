import 'package:flutter/material.dart';

import '../../model/todos.dart';
import '../../view_model/todo_vm.dart';

class UncompleteTodoScreen extends StatefulWidget {
  const UncompleteTodoScreen({super.key});

  @override
  State<UncompleteTodoScreen> createState() => _UncompleteTodoScreenState();
}

class _UncompleteTodoScreenState extends State<UncompleteTodoScreen> {
  TodosVM TVM =TodosVM();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: FutureBuilder( future:  TVM.getAllTodos(),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.done)

          { List<Todos> uncompleteTodos =snapshot.data!.where((element)
          => element.completed==false,).toList();

          return ListView.builder(
            itemCount: uncompleteTodos.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                color: Colors.blue,
                height: 100,
                child:Column(
                  children: [
                    Text("the id = ${uncompleteTodos[index].id}"),
                    Text("the completed = ${uncompleteTodos[index].completed}"),
                    Text("the todo = ${uncompleteTodos[index].todo}"),
                    Text("the userid = ${uncompleteTodos[index].userId}"),
                  ],
                ),
              );
            },);}
          else {
            return  Center(child: CircularProgressIndicator());
          }



        },),
    );
  }
}
