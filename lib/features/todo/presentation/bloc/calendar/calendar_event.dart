part of 'calendar_bloc.dart';

@immutable
abstract class CalendarEvent {}

final class ChangeDateEvent extends CalendarEvent{
  final DateTime dateTime;

  ChangeDateEvent(this.dateTime);

}