import 'package:dependencyinjection/features/todo/presentation/bloc/calendar/calendar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/add_todo_page.dart';


addTodoButton(BuildContext context, DateTime dateTime) {
  return FloatingActionButton(
    onPressed: () {
      BlocProvider.of<CalendarBloc>(context).add(ChangeDateEvent(dateTime));
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => AddTodo(dateTime: dateTime,))
      );
    },
    child: const Icon(Icons.add),
  );
}