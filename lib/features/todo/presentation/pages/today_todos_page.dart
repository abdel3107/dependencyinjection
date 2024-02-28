import 'package:dependencyinjection/features/todo/domain/entities/todo_entity.dart';
import 'package:dependencyinjection/features/todo/presentation/widgets/build_appbar.dart';
import 'package:dependencyinjection/features/todo/presentation/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../injection_container.dart';
// import '../bloc/completeTodo/complete_todo_bloc.dart';
import '../bloc/todo/todo_bloc.dart';
import '../widgets/add_todo_button.dart';
import '../widgets/body_builder.dart';
import 'add_todo_page.dart';

class LoadTodosPage extends StatelessWidget {
  const LoadTodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime dateTimeToday = DateTime.now();
    BlocProvider.of<TodoBloc>(context).add(LoadTodosByDateEvent(dateTimeToday));
    return Scaffold(
      appBar: buildAppBar(context, "Today's todos"),
      body: buildBody(context, dateTimeToday),
      floatingActionButton: addTodoButton(context, dateTimeToday),
      drawer: drawer(context),
    );
  }

}
