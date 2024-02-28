import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/todo_entity.dart';
import '../bloc/todo/todo_bloc.dart';


showModifyDialog(BuildContext context, TodoEntity todo, DateTime dateTime){
  TextEditingController editController = TextEditingController(
      text: todo.title.toString()
  );
  showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: editController,
                // initialValue: editController.text.toString(),
                autofocus: true,
              ),
            ],
          ),
          actions: [
            TextButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: const Text('Cancel')
            ),
            TextButton(
                onPressed: (){
                  BlocProvider.of<TodoBloc>(context).add(
                      UpdateTodoEvent(todo, editController.text.toString().trim(), dateTime)
                  );
                  Navigator.pop(context);
                },
                child: const Text('Modify')
            ),
          ],
        );
      }
  );

}