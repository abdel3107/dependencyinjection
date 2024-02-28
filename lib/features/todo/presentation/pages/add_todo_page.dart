import 'package:dependencyinjection/features/todo/domain/entities/todo_entity.dart';
import 'package:dependencyinjection/features/todo/presentation/bloc/calendar/calendar_bloc.dart';
import 'package:dependencyinjection/features/todo/presentation/bloc/todo/todo_bloc.dart';
import 'package:dependencyinjection/features/todo/presentation/widgets/build_appbar.dart';
import 'package:dependencyinjection/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTodo extends StatelessWidget {
  final DateTime dateTime;
  const AddTodo({super.key, required this.dateTime,});
  
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: buildAppBar(context, "Add new Todo"),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: BlocBuilder<CalendarBloc, DateTime>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  TextField(
                    autofocus: true,
                    controller: controller,
                    style: const TextStyle(
                      color: Colors.deepOrange,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Enter task',
                      labelStyle: TextStyle(
                        color: Colors.deepOrange
                      ),

                    ),

                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height*0.01,),
                  GestureDetector(
                    onTap: ()=> _selectDate(context),
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        label: Row(
                          children: [
                            const Icon(
                              Icons.calendar_month,
                              color: Colors.deepOrange,
                            ),
                            const SizedBox(width: 10,),
                            Text(
                              '${state.day}/${state.month}/${state.year}',
                              style: const TextStyle(
                                color: Colors.deepOrange
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height*0.05,),
                  ElevatedButton(
                      onPressed: (){
                        BlocProvider.of<TodoBloc>(context).add(AddTodoEvent(
                            TodoEntity(
                                title: controller.text.toString().trim(),
                                completed: false,
                                dateTime: state,
                            ),
                            dateTime
                        ));
                        BlocProvider.of<TodoBloc>(context).add(
                            LoadTodosByDateEvent(dateTime),
                        );
                        // s1<TodoBloc>().add(LoadTodosEvent());
                        Navigator.pop(context);
                      },

                      child: const Text("Submit")
                  ),

                ],
              );
  },
),
        ),
      ),
    );
  }


  Future<void> _selectDate(BuildContext context) async{
    DateTime date = BlocProvider.of<CalendarBloc>(context).state;
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year+1),
    );
    if (picked != null && picked != date){
      
      BlocProvider.of<CalendarBloc>(context).add(ChangeDateEvent(picked));
      
    }
  }

}

