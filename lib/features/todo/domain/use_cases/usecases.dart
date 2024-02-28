import 'package:dependencyinjection/features/todo/data/repositories/local_todos_repository.dart';
import 'package:dependencyinjection/features/todo/domain/entities/todo_entity.dart';

import '../repositories/todos_repository.dart';

class GetTodosUseCase {
  final TodosRepositoryImp repository;

  GetTodosUseCase(this.repository);

  Future<List<TodoEntity>> call() async {
    return await repository.getTodos();
  }
}

class GetTodosByDateUseCase {
  final TodosRepositoryImp repository;

  GetTodosByDateUseCase(this.repository);

  Future<List<TodoEntity>> call(DateTime dateTime) async {
    return await repository.getTodosByDate(dateTime);
  }
}

class AddTodoUseCase {
  final TodosRepositoryImp repository;
  AddTodoUseCase(this.repository);

  Future<void> call(String title, DateTime dateTime) async {
    final todo = TodoEntity(title: title, completed: false, dateTime: dateTime);
    await repository.addTodo(todo);
  }
}

class UpdateTodoUseCase {
  final TodosRepositoryImp repository;

  UpdateTodoUseCase(this.repository);

  Future<void> call(TodoEntity todo, String newTitle) async {
    await repository.updateTodo(todo, newTitle);
  }
}

class DeleteTodoUseCase {
  final TodosRepositoryImp repository;

  DeleteTodoUseCase(this.repository);

  Future<void> call(int id) async {
    await repository.deleteTodo(id);
  }
}
class CompleteTodoUseCase {
  final TodosRepositoryImp repository;

  CompleteTodoUseCase(this.repository);


  Future<void> call(int id) async {
    await repository.completeTodo(id);
  }
}

class UncompleteTodoUseCase {
  final TodosRepositoryImp repository;

  UncompleteTodoUseCase(this.repository);


  Future<void> call(int id) async {
    await repository.uncompleteTodo(id);
  }
}