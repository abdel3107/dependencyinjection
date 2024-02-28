import 'package:dependencyinjection/features/todo/presentation/widgets/add_todo_button.dart';
import 'package:dependencyinjection/features/todo/presentation/widgets/build_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/todo_entity.dart';
import '../bloc/todo/todo_bloc.dart';
import '../widgets/body_builder.dart';
import '../widgets/drawer.dart';
import 'add_todo_page.dart';

class Tomorrow extends StatelessWidget {
  const Tomorrow({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime dateTimeTomorrow = DateTime.now().add(const Duration(days: 1));
    BlocProvider.of<TodoBloc>(context).add(LoadTodosByDateEvent(dateTimeTomorrow));
    return Scaffold(
      appBar: buildAppBar(context, "Tomorrow's todos"),
      body: buildBody(context, dateTimeTomorrow),
      floatingActionButton: addTodoButton(context, dateTimeTomorrow),
      drawer: drawer(context),
    );
  }

}
