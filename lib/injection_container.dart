import 'package:dependencyinjection/features/todo/data/local/data_sources/todo_local_data_source.dart';
import 'package:dependencyinjection/features/todo/data/local/database_helper.dart';
import 'package:dependencyinjection/features/todo/data/repositories/local_todos_repository.dart';
import 'package:dependencyinjection/features/todo/domain/use_cases/usecases.dart';
import 'package:dependencyinjection/features/todo/presentation/bloc/calendar/calendar_bloc.dart';
import 'package:dependencyinjection/features/todo/presentation/bloc/todo/todo_bloc.dart';
import 'package:get_it/get_it.dart';

import 'features/todo/domain/repositories/todos_repository.dart';

final s1 = GetIt.instance;
final s2 = GetIt.instance;
final s3 = GetIt.instance;
final s4 = GetIt.instance;

Future<void> initializeDependencies() async{

  s1.registerSingleton<DatabaseHelper>(DatabaseHelper());
  s1.registerSingleton<TodoLocalDataSource>(TodoLocalDataSource(s1()));
  s1.registerSingleton<TodosRepositoryImp>(TodosRepositoryImp(s1()));
  s2.registerSingleton<AddTodoUseCase>(AddTodoUseCase(s1()));
  s3.registerSingleton<DeleteTodoUseCase>(DeleteTodoUseCase(s1()));
  s4.registerSingleton<CompleteTodoUseCase>(CompleteTodoUseCase(s1()));
  s4.registerSingleton<UncompleteTodoUseCase>(UncompleteTodoUseCase(s1()));
  s4.registerSingleton<UpdateTodoUseCase>(UpdateTodoUseCase(s1()));
  s4.registerSingleton<GetTodosByDateUseCase>(GetTodosByDateUseCase(s1()));
  s1.registerSingleton<GetTodosUseCase>(GetTodosUseCase(s1()));



  s1.registerFactory<TodoBloc>(
      ()=> TodoBloc()
  );

 }