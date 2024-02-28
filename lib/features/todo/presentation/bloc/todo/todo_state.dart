part of 'todo_bloc.dart';

abstract class TodoState  {
  const TodoState();
}

class TodoInitialState extends TodoState {
}

class TodoLoadedState extends TodoState {
  final List<TodoEntity> todos;
  TodoLoadedState(this.todos);
}

class TodoErrorState extends TodoState{
  final String errorMessage;

  TodoErrorState(this.errorMessage);
}
