import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/todo_entity.dart';
import '../bloc/todo/todo_bloc.dart';
import 'delete_dialog.dart';
import 'modify_dialog.dart';


buildBody(BuildContext context, DateTime dateTime){
  return BlocBuilder<TodoBloc, TodoState>(
    builder: (_, state) {
      if (state is TodoInitialState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is TodoLoadedState) {
        if (state.todos.isEmpty){
          return const Center(
            child: Text('No Todo'),
          );
        }
        else {
          return ListView.builder(
            // key: ValueKey(200),
            itemBuilder: (context, index) {
              if (!state.todos[index].completed){
                return ListTile(
                  onTap: (){
                    BlocProvider.of<TodoBloc>(context).add(CompleteTodoEvent(state.todos[index].id??0, dateTime));
                  },
                  leading: GestureDetector(
                    child: const Icon(Icons.check_box_outline_blank),
                    onTap: (){
                      BlocProvider.of<TodoBloc>(context).add(CompleteTodoEvent(state.todos[index].id??0, dateTime));
                    },
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      GestureDetector(
                        child: Icon(
                          Icons.edit,
                          size: MediaQuery.sizeOf(context).height*0.04,

                        ),
                        onTap: (){
                          showModifyDialog(context, state.todos[index], dateTime);
                        },
                      ),
                      // SizedBox(width: MediaQuery.sizeOf(context).width*0.05,),
                      GestureDetector(
                        child: Icon(
                          Icons.delete,
                          size: MediaQuery.sizeOf(context).height*0.04,
                        ),
                        onTap: (){
                          showDeleteDialog(context, state.todos[index], dateTime);
                        },
                      ),
                    ],
                  ),
                  title: Text(
                    state.todos[index].title,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  subtitle: Text(state.todos[index].dateTime.toString()),
                );
              }
              else {
                return ListTile(
                  onTap: (){
                    BlocProvider.of<TodoBloc>(context).add(UncompleteTodoEvent(state.todos[index].id??0, dateTime));
                  },
                  leading: GestureDetector(
                    child: const Icon(Icons.check_box),
                    onTap: (){
                      BlocProvider.of<TodoBloc>(context).add(UncompleteTodoEvent(state.todos[index].id??0, dateTime));
                    },
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        child: Icon(
                          Icons.edit,
                          size: MediaQuery.sizeOf(context).height*0.04,
                        ),
                        onTap: (){
                          showModifyDialog(context, state.todos[index], dateTime);
                        },
                      ),
                      GestureDetector(
                        child: Icon(
                          Icons.delete,
                          size: MediaQuery.sizeOf(context).height*0.04,
                        ),
                        onTap: (){
                          showDeleteDialog(context, state.todos[index], dateTime);
                        },
                      ),
                    ],
                  ),
                  title: Text(
                    state.todos[index].title,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                        decoration: TextDecoration.lineThrough
                    ),
                  ),
                  subtitle: Text(state.todos[index].dateTime.toString()),
                );
              }


            },
            itemCount: state.todos.length,
          );
        }
      }
      return const SizedBox();
    },
  );
}

