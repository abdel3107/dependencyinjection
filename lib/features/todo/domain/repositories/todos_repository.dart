import 'package:dependencyinjection/features/todo/data/local/models/local_todo_model.dart';
import 'package:dependencyinjection/features/todo/domain/entities/todo_entity.dart';

abstract class TodosRepository {
  Future<List<TodoEntity>> getTodos();
  Future<List<TodoEntity>> getTodosByDate(DateTime dateTime);
  Future<void> addTodo(TodoEntity todo);
  Future<void> updateTodo(TodoEntity todo, String newTitle);
  Future<void> deleteTodo(int id);
  Future<void> completeTodo(int id);
  Future<void> uncompleteTodo(int id);
}