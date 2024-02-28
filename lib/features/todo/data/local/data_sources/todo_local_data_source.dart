import 'package:sqflite/sqflite.dart';

import '../database_helper.dart';
import '../models/local_todo_model.dart';

class TodoLocalDataSource {
  final DatabaseHelper databaseHelper;

  TodoLocalDataSource(this.databaseHelper);

  Future<List<TodoModel>> getTodos() async {
    final mapsList = await databaseHelper.getTodos();

    List<TodoModel> todoList = [];

    for (Map<String, dynamic> map in mapsList){
      TodoModel todoModel = TodoModel.fromMap(map);
      todoList.add(todoModel);
    }
    return todoList;
  }

  Future<List<TodoModel>> getTodosByDate(DateTime dateTime) async {
    final mapsList = await databaseHelper.getTodosByDate(dateTime);

    List<TodoModel> todoList = [];
    for (Map<String, dynamic> map in mapsList){
      TodoModel todoModel = TodoModel.fromMap(map);
      todoList.add(todoModel);
    }
    return todoList;
  }

  Future<void> addTodo(TodoModel todo) async {
    await databaseHelper.insertTodo(todo);
  }

  Future<void> deleteTodo(int id) async {
    await databaseHelper.deleteTodo(id);
  }

  Future<void> updateTodo(TodoModel todo, String newTitle) async {
    await databaseHelper.updateTodo(todo, newTitle);
  }

  Future<void> completeTodo(int id) async {
    await databaseHelper.completeTodo(id);
  }

  Future<void> uncompleteTodo(int id) async {
    await databaseHelper.uncompleteTodo(id);
  }

}