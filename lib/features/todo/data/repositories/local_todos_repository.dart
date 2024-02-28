import 'package:dependencyinjection/features/todo/data/local/models/local_todo_model.dart';
import 'package:dependencyinjection/features/todo/domain/entities/todo_entity.dart';
import 'package:dependencyinjection/features/todo/domain/repositories/todos_repository.dart';

import '../local/data_sources/todo_local_data_source.dart';

class TodosRepositoryImp implements TodosRepository {
  final TodoLocalDataSource localDataSource;

  TodosRepositoryImp(this.localDataSource);

  @override
  Future<void> addTodo(TodoEntity todo) async {
    TodoModel todoModel = TodoModel(
        id: todo.id,
        title: todo.title,
        completed: todo.completed,
        dateTime: todo.dateTime,
    );
    await localDataSource.addTodo(todoModel);
  }

  @override
  Future<void> deleteTodo(int id) async {
    await localDataSource.deleteTodo(id);
  }

  @override
  Future<List<TodoEntity>> getTodos() async {
    return await localDataSource.getTodos();
  }

  @override
  Future<List<TodoEntity>> getTodosByDate(DateTime dateTime) async {
    return await localDataSource.getTodosByDate(dateTime);
  }

  @override
  Future<void> updateTodo(TodoEntity todo, String newTitle) async{
    TodoModel todoModel = TodoModel(
      id: todo.id,
      title: todo.title,
      completed: todo.completed,
      dateTime: todo.dateTime,
    );
    await localDataSource.updateTodo(todoModel, newTitle);
  }

  @override
  Future<void> completeTodo(int id) async {
    await localDataSource.completeTodo(id);
  }

  @override
  Future<void> uncompleteTodo(int id) async {
    await localDataSource.uncompleteTodo(id);
  }
}