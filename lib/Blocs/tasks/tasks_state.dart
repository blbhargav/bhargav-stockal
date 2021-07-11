part of 'tasks_bloc.dart';

abstract class TasksState extends Equatable {
  const TasksState();
}

class TasksInitial extends TasksState {
  @override
  List<Object> get props => [];
}
class RefreshListState extends TasksState{
  @override
  List<Object> get props => [];
}

class AddTaskState extends TasksState{
  @override
  List<Object> get props => [];
}
