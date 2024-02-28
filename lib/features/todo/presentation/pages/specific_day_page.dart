import 'package:dependencyinjection/features/todo/presentation/bloc/todo/todo_bloc.dart';
import 'package:dependencyinjection/features/todo/presentation/widgets/add_todo_button.dart';
import 'package:dependencyinjection/features/todo/presentation/widgets/body_builder.dart';
import 'package:dependencyinjection/features/todo/presentation/widgets/build_appbar.dart';
import 'package:dependencyinjection/features/todo/presentation/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecificDayPage extends StatelessWidget {
  final DateTime dateTime;
  const SpecificDayPage({super.key, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TodoBloc>(context).add(LoadTodosByDateEvent(dateTime));
    String date = "${dateTime.toIso8601String().substring(8,10)}"
        "-${dateTime.toIso8601String().substring(5, 7)}"
        "-${dateTime.toIso8601String().substring(0, 4)}";
    return Scaffold(
      appBar: buildAppBar(context, date),
      // drawer: drawer(context),
      body: buildBody(context, dateTime),
      floatingActionButton: DateTime.now().compareTo(dateTime) != 1 ?
      addTodoButton(context, dateTime): FloatingActionButton(
        onPressed: (){},
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
    );
  }
}
