part of 'drawer_bloc.dart';

@immutable
abstract class DrawerEvent {}

final class ChangeDrawerItemEvent extends DrawerEvent{
  final int newIndex;

  ChangeDrawerItemEvent(this.newIndex);
}
