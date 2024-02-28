import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'drawer_event.dart';

class DrawerBloc extends Bloc<DrawerEvent, int> {
  DrawerBloc() : super(1) {
    on<ChangeDrawerItemEvent>((event, emit) {
      emit(event.newIndex);
    });
  }
}
