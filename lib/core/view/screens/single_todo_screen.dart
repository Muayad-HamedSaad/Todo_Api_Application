import 'package:flutter/material.dart';
import 'package:todos_api/core/model/todos.dart';
import 'package:todos_api/core/view_model/todo_vm.dart';

class SingleTodoScreen extends StatefulWidget {
  const SingleTodoScreen({super.key});

  @override
  State<SingleTodoScreen> createState() => _SingleTodoScreenState();
}

class _SingleTodoScreenState extends State<SingleTodoScreen> {
  TodosVM TVM =TodosVM();
  final TextEditingController idController = TextEditingController();
  Todos? todo;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Single Todo By id'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: idController,
              decoration: InputDecoration(
                labelText: 'Enter Todo ID',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  isLoading = true; // Show loading indicator
                });
                String id = idController.text;
                try {
                  todo = await TVM.getSingleTodo(id: int.parse(id));
                } catch (e) {
                  todo = null; // Handle error case
                } finally {
                  setState(() {
                    isLoading = false; // Hide loading indicator
                  });
                }
              },
              child: Text('Show Todo'),
            ),
            SizedBox(height: 20),
            if (isLoading)
              CircularProgressIndicator()
            else if (todo != null)
              Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                color: Colors.blue,
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
    );
  }
}
