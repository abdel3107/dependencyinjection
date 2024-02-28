import 'dart:collection';

import 'package:dependencyinjection/features/todo/presentation/pages/specific_day_page.dart';
import 'package:dependencyinjection/features/todo/presentation/pages/utils.dart';
import 'package:dependencyinjection/features/todo/presentation/widgets/build_appbar.dart';
import 'package:dependencyinjection/features/todo/presentation/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ChooseDay extends StatefulWidget {
  const ChooseDay({super.key});

  @override
  State<ChooseDay> createState() => _ChooseDayState();
}

class _ChooseDayState extends State<ChooseDay> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? selectedDay;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Choose a day"),
      drawer: drawer(context),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height*0.01,
          ),
          TableCalendar(
            focusedDay: _focusedDay,
            firstDay: DateTime.now().subtract(const Duration(days: 365*3)),
            lastDay: DateTime.now().add(const Duration(days: 365*3)),
            calendarFormat: _calendarFormat,
            calendarStyle: const CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: Colors.deepOrange,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                border: Border(),
                color: Colors.black,
                shape: BoxShape.circle
              )
            ),
            selectedDayPredicate: (day) {
              return isSameDay(selectedDay, day);
            },
            onDaySelected: (selectedDay1, focusedDay) {
              if (!isSameDay(selectedDay, selectedDay1)) {
                setState(() {
                  selectedDay = selectedDay1;
                  _focusedDay = focusedDay;
                });
              }
            },
            // onPageChanged: (focusedDay) {
            //   // No need to call `setState()` here
            //   _focusedDay = focusedDay;
            // },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                // Call `setState()` when updating calendar format
                setState(() {
                  _calendarFormat = format;
                });
              }
            },

          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height*0.03,
          ),
          ElevatedButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SpecificDayPage(dateTime: selectedDay?? DateTime.now())),
              );
            },
            style: ElevatedButton.styleFrom(
              fixedSize: Size(
                MediaQuery.sizeOf(context).width*0.5,
                MediaQuery.sizeOf(context).height*0.03,
              ),
            ),
            child: const Text('Go'),
          )
        ],
      ),
    );
  }
}
