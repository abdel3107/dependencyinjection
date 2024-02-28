import 'package:equatable/equatable.dart';

class TodoEntity extends Equatable{
  int? id;
  final String title;
  final bool completed;
  final DateTime dateTime;

  TodoEntity({
    this.id,
    required this.title,
    required this.completed,
    required this.dateTime,
  });

  TodoEntity copyWith({
    int? id,
    String? title,
    bool? completed,
    DateTime? dateTime,
  }){
    return TodoEntity(
        id: id ?? this.id ,
        title: title ?? this.title,
        completed: completed?? this.completed,
        dateTime: dateTime ?? this.dateTime,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props {
    return [
      id,
      title,
      completed,
      dateTime,
    ];
  }

}