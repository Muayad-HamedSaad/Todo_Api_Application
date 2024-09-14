import 'package:flutter/material.dart';

import '../../model/todos.dart';
import '../../view_model/todo_vm.dart';
class LimtSkipTodosScreen extends StatefulWidget {
  const LimtSkipTodosScreen({super.key});

  @override
  State<LimtSkipTodosScreen> createState() => _LimtSkipTodosScreenState();
}

class _LimtSkipTodosScreenState extends State<LimtSkipTodosScreen> {
  TodosVM TVM =TodosVM();
  final TextEditingController limitController = TextEditingController();
  final TextEditingController skipController = TextEditingController();
  List<Todos>? subTodos;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: limitController,
              decoration: InputDecoration(
                labelText: 'Enter limit Todos Number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            TextField(
              controller: skipController,
              decoration: InputDecoration(
                labelText: 'Enter Skip Todos Number',
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
                int limitNumber =int.parse(limitController.text) ;
                int skipNumber =int.parse(skipController.text) ;
                try {
                  subTodos = await TVM.getLimitSkipTodos(limit:limitNumber, skip:skipNumber);
                } catch (e) {
                  subTodos = null; // Handle error case
                } finally {
                  setState(() {
                    isLoading = false; // Hide loading indicator
                  });
                }
              },
              child: Text('Show Todos'),
            ),
            SizedBox(height: 20),
            if (isLoading)
              CircularProgressIndicator()
            else if (subTodos != null)
              Expanded(
                child: ListView.builder(
                    itemCount:subTodos!.length,
                    itemBuilder:(context, index) =>
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                          color: Colors.pinkAccent,
                          height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("ID: ${subTodos![index].id}"),
                                Text("Completed: ${subTodos![index].completed}"),
                                Text("Todo: ${subTodos![index].todo}"),
                                Text("User ID: ${subTodos![index].userId}"),
                              ],
                            ),
                          )
                        )
                )
            else if (subTodos == null && !isLoading)
                Text("No todo found or error occurred."),
          ],),
      ),
    );
  }
}
