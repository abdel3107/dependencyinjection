import 'package:dependencyinjection/features/todo/presentation/widgets/build_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/todo_entity.dart';
import '../bloc/todo/todo_bloc.dart';
import '../widgets/body_builder.dart';
import '../widgets/drawer.dart';
import 'add_todo_page.dart';

class Yesterday extends StatelessWidget {
  const Yesterday({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime dateTimeYesterday = DateTime.now().subtract(const Duration(days: 1));
    BlocProvider.of<TodoBloc>(context).add(LoadTodosByDateEvent(dateTimeYesterday));
    return Scaffold(
      appBar: buildAppBar(context, "Yesterday's Todos"),
      body: buildBody(context, dateTimeYesterday),
      drawer: drawer(context),
    );
  }



}
