part of 'todo_bloc.dart';

abstract class TodoEvent {
}

class LoadTodosEvent extends TodoEvent {
}

class LoadTodosByDateEvent extends TodoEvent{
  final DateTime dateTime;
  LoadTodosByDateEvent(this.dateTime);
}

class AddTodoEvent extends TodoEvent {
  final TodoEntity todo;
  final DateTime dateTime;
  AddTodoEvent(this.todo, this.dateTime);
}

class UpdateTodoEvent extends TodoEvent {
  final TodoEntity todo;
  final String newTitle;
  final DateTime dateTime;

  UpdateTodoEvent(this.todo, this.newTitle, this.dateTime);
}

class DeleteTodoEvent extends TodoEvent {
  // final int todoId;
  final TodoEntity todo;
  final DateTime dateTime;

  DeleteTodoEvent(this.todo, this.dateTime);
}

class CompleteTodoEvent extends TodoEvent {
  final int todoId;
  final DateTime dateTime;

  CompleteTodoEvent(this.todoId, this.dateTime);
}

class UncompleteTodoEvent extends TodoEvent {
  final int todoId;
  final DateTime dateTime;

  UncompleteTodoEvent(this.todoId, this.dateTime);
}