import 'package:flutter/material.dart';

import '../../model/todos.dart';
import '../../view_model/todo_vm.dart';
class RandomTodoScreen extends StatefulWidget {
  const RandomTodoScreen({super.key});

  @override
  State<RandomTodoScreen> createState() => _RandomTodoScreenState();
}

class _RandomTodoScreenState extends State<RandomTodoScreen> {
  TodosVM TVM =TodosVM();
  Todos? todo;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body:  Container(
        margin: EdgeInsets.symmetric(horizontal: 3 ,vertical: 5),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      isLoading = true; // Show loading indicator
                    });
                    try {
                      todo = await TVM.getRandomTodo();
                    } catch (e) {
                      todo = null; // Handle error case
                    } finally {
                      setState(() {
                        isLoading = false; // Hide loading indicator
                      });
                    }
                  },
                  child: Text('Show Random Todo'),
                ),
                SizedBox(height: 20),
                if (isLoading)
                  CircularProgressIndicator()
                else if (todo != null)
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    color: Colors.white,
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("ID: ${todo!.id}"),
                        Text("Completed: ${todo!.completed}"),
                        Text("Todo: ${todo!.todo}"),
                        Text("User ID: ${todo!.userId}"),
                      ],
                    ),
                  )
                else if (todo == null && !isLoading)
                    Text("No todo found or error occurred."),

              ],),
        ),
      ),
      );
  }
}
