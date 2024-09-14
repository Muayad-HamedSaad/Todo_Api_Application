import 'package:dio/dio.dart';
import 'package:todos_api/core/model/todos.dart';

class TodosVM {
  Dio d = Dio();

  Future<List<Todos>?> getAllTodos() async {
    Response res = await d.get('https://dummyjson.com/todos');
    Map<String, dynamic> maptods = res.data as Map<String, dynamic>;
    List<Todos>? allTodos = maptods["todos"].map<Todos>((e) =>
        Todos.fromJson(e)).toList();

    return allTodos;
  }



  Future<Todos> getSingleTodo({required int id}) async {
    Response res = await d.get('https://dummyjson.com/todos/${id}');
    Todos Todo = Todos.fromJson(res.data as Map<String, dynamic>);

    return Todo;
  }



  Future<Todos> getRandomTodo() async {
    Response res = await d.get('https://dummyjson.com/todos/random');
    Todos Todo = Todos.fromJson(res.data as Map<String, dynamic>);

    return Todo;
  }


  Future<List<Todos>?> getRandomTodosByNumber({required int TodosNumber}) async {
    Response res = await d.get('https://dummyjson.com/todos/random/${TodosNumber}');
    List<Todos>? allTodos = res.data.map<Todos>((e) =>
        Todos.fromJson(e)).toList();

    return allTodos;
  }

  Future<List<Todos>?> getLimitSkipTodos({required int limit ,required int skip}) async {
    Response res = await d.get('https://dummyjson.com/todos?limit=${limit}&skip=${skip}');
    Map<String, dynamic> maptods = res.data as Map<String, dynamic>;
    List<Todos>? allTodos = maptods["todos"].map<Todos>((e) =>
        Todos.fromJson(e)).toList();

    return allTodos;
  }

}