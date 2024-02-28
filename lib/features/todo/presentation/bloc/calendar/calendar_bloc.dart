import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'calendar_event.dart';
//

class CalendarBloc extends Bloc<CalendarEvent, DateTime> {
  CalendarBloc() : super(DateTime.now()) {
    on<ChangeDateEvent>((event, emit) {
      emit(event.dateTime);
    });
  }
}
