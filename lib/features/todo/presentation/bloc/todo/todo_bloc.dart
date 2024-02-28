// import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dependencyinjection/features/todo/data/repositories/local_todos_repository.dart';
import 'package:dependencyinjection/features/todo/domain/repositories/todos_repository.dart';
import 'package:dependencyinjection/features/todo/domain/use_cases/usecases.dart';
import 'package:dependencyinjection/injection_container.dart';
import 'package:get_it/get_it.dart';

import '../../../domain/entities/todo_entity.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitialState()) {
    on<LoadTodosEvent>((event, emit) async{
      // emit(TodoInitialState());
      final todos = await s1<GetTodosUseCase>().call();
      emit(TodoLoadedState(todos));
    });
    
    on<LoadTodosByDateEvent>((event, emit) async{
      final todos = await s4<GetTodosByDateUseCase>().call(event.dateTime);
      emit(TodoLoadedState(todos));
    });

    on<AddTodoEvent>((event, emit) async{
      s1<TodosRepositoryImp>().addTodo(event.todo);
      // print("after: ${event.todo.title.toString()}");
    });

    on<DeleteTodoEvent>((event, emit) async{
      int todoId = event.todo.id??0;
      s3<DeleteTodoUseCase>().call(todoId);
      final todos = await s4<GetTodosByDateUseCase>().call(event.dateTime);
      emit(TodoLoadedState(todos));
    });

    on<CompleteTodoEvent>((event, emit) async{
      // final todos = await s1<GetTodosUseCase>().call();

      s4<CompleteTodoUseCase>().call(event.todoId);

      final todos = await s4<GetTodosByDateUseCase>().call(event.dateTime);
      emit(TodoLoadedState(todos));
    });

    on<UpdateTodoEvent>((event, emit) async{
      s4<UpdateTodoUseCase>().call(event.todo, event.newTitle);

      final todos = await s4<GetTodosByDateUseCase>().call(event.dateTime);
      emit(TodoLoadedState(todos));
    });

    on<UncompleteTodoEvent>((event, emit) async{
      s4<UncompleteTodoUseCase>().call(event.todoId);

      final todos = await s4<GetTodosByDateUseCase>().call(event.dateTime);
      emit(TodoLoadedState(todos));
    });
  }
}
