import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/todo_entity.dart';
import '../bloc/todo/todo_bloc.dart';


showDeleteDialog(BuildContext context, TodoEntity todo, DateTime dateTime){
  showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: const Text(
              "Do you really want to delete ?"
          ),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: (){
                BlocProvider.of<TodoBloc>(context).add(DeleteTodoEvent(todo, dateTime));
                Navigator.pop(context);
              },
              child: const Text("Delete"),
            ),
          ],
        );
      }
  );
}