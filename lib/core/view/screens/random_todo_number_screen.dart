import 'package:flutter/material.dart';
import '../../model/todos.dart';
import '../../view_model/todo_vm.dart';
class RandomTodoNumberScreen extends StatefulWidget {
  const RandomTodoNumberScreen({super.key});

  @override
  State<RandomTodoNumberScreen> createState() => _RandomTodoNumberScreenState();
}

class _RandomTodoNumberScreenState extends State<RandomTodoNumberScreen> {
  TodosVM TVM =TodosVM();
  final TextEditingController RandomNumberController = TextEditingController();
  List<Todos>? subTodos;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: RandomNumberController,
              decoration: InputDecoration(
                labelText: 'Enter Todo Numbers',
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
                String Tnumber = RandomNumberController.text;
                try {
                  subTodos = await TVM.getRandomTodosByNumber(TodosNumber:int.parse(Tnumber));
                } catch (e) {
                  subTodos = null; // Handle error case
                } finally {
                  setState(() {
                    isLoading = false; // Hide loading indicator
                  });
                }
              },
              child: Text('Show Random Todos'),
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
                 color: Colors.white,
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
                          ),
              )
            else if (subTodos == null && !isLoading)
                Text("No todo found or error occurred."),
          ],),
      ),
    );
  }
}
