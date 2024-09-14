import 'package:flutter/material.dart';
import 'package:todos_api/core/model/todos.dart';
import 'package:todos_api/core/view_model/todo_vm.dart';

class CompleteTodoScreen extends StatefulWidget {
  const CompleteTodoScreen({super.key});

  @override
  State<CompleteTodoScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<CompleteTodoScreen> {
  TodosVM TVM =TodosVM();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: FutureBuilder( future:  TVM.getAllTodos(),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.done)
          { List<Todos> completeTodos =snapshot.data!.where((element)
          => element.completed==true,).toList();

            return ListView.builder(
            itemCount: completeTodos.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                color: Colors.blue,
                height: 100,
                child:Column(
                  children: [
                    Text("the id = ${completeTodos[index].id}"),
                    Text("the completed = ${completeTodos[index].completed}"),
                    Text("the todo = ${completeTodos[index].todo}"),
                    Text("the userid = ${completeTodos[index].userId}"),
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
