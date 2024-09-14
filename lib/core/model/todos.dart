class Todos {
  Todos({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userId,
  });

  final int? id;
  final String? todo;
  final bool? completed;
  final int? userId;

  factory Todos.fromJson(Map<String, dynamic> json){
    return Todos(
      id: json["id"],
      todo: json["todo"],
      completed: json["completed"],
      userId: json["userId"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "todo": todo,
    "completed": completed,
    "userId": userId,
  };

}
