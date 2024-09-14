import 'package:flutter/material.dart';
import 'package:todos_api/core/view_model/todo_vm.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({super.key});

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  TodosVM TVM =TodosVM();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: FutureBuilder( future:  TVM.getAllTodos(),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.done)
          {return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                color: Colors.blue,
                height: 100,
                child:Column(
                  children: [
                    Text("the id = ${snapshot.data![index].id}"),
                    Text("the completed = ${snapshot.data![index].completed}"),
                    Text("the todo = ${snapshot.data![index].todo}"),
                    Text("the userid = ${snapshot.data![index].userId}"),
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
