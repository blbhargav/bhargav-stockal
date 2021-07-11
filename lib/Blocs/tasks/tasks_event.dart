part of 'tasks_bloc.dart';

abstract class TasksEvent extends Equatable {
  const TasksEvent();
}
class RefreshItemsEvent extends TasksEvent{
  @override
  List<Object> get props => [];
}
class AddTaskEvent extends TasksEvent{
  @override
  List<Object> get props => [];
}
class CancelAddingItemEvent extends TasksEvent{
  @override
  List<Object> get props => [];
}