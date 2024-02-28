// import 'package:dependencyinjection/features/todo/presentation/bloc/completeTodo/complete_todo_bloc.dart';
import 'package:dependencyinjection/features/todo/presentation/bloc/calendar/calendar_bloc.dart';
import 'package:dependencyinjection/features/todo/presentation/bloc/drawer/drawer_bloc.dart';
import 'package:dependencyinjection/features/todo/presentation/bloc/todo/todo_bloc.dart';
import 'package:dependencyinjection/features/todo/presentation/pages/choose_day.dart';
import 'package:dependencyinjection/features/todo/presentation/pages/contactUs.dart';
import 'package:dependencyinjection/features/todo/presentation/pages/settings.dart';
import 'package:dependencyinjection/features/todo/presentation/pages/today_todos_page.dart';
import 'package:dependencyinjection/features/todo/presentation/pages/tomorrow_todos_page.dart';
import 'package:dependencyinjection/features/todo/presentation/pages/yesterday_todos_page.dart';
import 'package:dependencyinjection/features/todo/presentation/widgets/drawer.dart';
import 'package:dependencyinjection/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/theme/app_theme.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // create: (context) => TodoBloc(),
      providers: [
        BlocProvider<TodoBloc>(
            create:(BuildContext context) => TodoBloc(),
        ),
        BlocProvider<DrawerBloc>(
            create: (BuildContext context) => DrawerBloc(),
        ),
        BlocProvider<CalendarBloc>(
            create: (BuildContext context) => CalendarBloc(),
        ),
        // BlocProvider<CompleteTodoBloc>(
        //     create: (BuildContext context) => CompleteTodoBloc(),
        // )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dependency injection',
        theme: theme(),
        home: BlocBuilder<DrawerBloc, int>(
          builder: (_, state) {

            if (state == 0){
              return const Yesterday();
            }
            else if (state == 1){
              return const LoadTodosPage();
            }
            else if (state == 2){
              return const Tomorrow();
            }
            else if (state == 3){
              return  const ChooseDay();
            }
            else if (state == 4){
              return const Settings();
            }
            else if (state == 5){
              return const ContactUsPage();
            }
            return const SizedBox();
          }
        ),
      ),
    );
  }
}

