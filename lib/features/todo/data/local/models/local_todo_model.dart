import 'package:dependencyinjection/features/todo/domain/entities/todo_entity.dart';

class TodoModel extends TodoEntity{

  int? id;
  final String title;
  final bool completed;
  final DateTime dateTime;

  TodoModel({
    this.id,
    required this.title,
    required this.completed,
    required this.dateTime,
  }) : super(id: id, title: title, completed: completed, dateTime: dateTime);

  factory TodoModel.fromMap(Map<String, dynamic> map){
    return TodoModel(
      id: map['id'],
      title: map['title'],
      completed: map['completed'] == 1,
      dateTime: DateTime.parse(map['date_time'])

    );
  }

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'title': title,
      'completed': completed ? 1 : 0,
      'date_time': dateTime.toIso8601String().substring(0,10)
    };
  }
}