import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(TasksInitial());

  @override
  Stream<TasksState> mapEventToState(
    TasksEvent event,
  ) async* {
    if(event is RefreshItemsEvent){
      yield TasksInitial();
      yield RefreshListState();
    }else if(event is AddTaskEvent){
      yield AddTaskState();
    }else if(event is CancelAddingItemEvent){
      yield TasksInitial();
    }
  }
}
