import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'layout_list_event.dart';
part 'layout_list_state.dart';

class LayoutListBloc extends Bloc<LayoutListEvent, LayoutListState> {
  LayoutListBloc() : super(LayoutListInitial());

  @override
  Stream<LayoutListState> mapEventToState(
    LayoutListEvent event,
  ) async* {
    if(event is RefreshLayoutStateEvent){
      yield LayoutListInitial();
      yield RefreshLayoutState();
    }
  }
}
