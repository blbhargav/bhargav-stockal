part of 'layout_list_bloc.dart';

abstract class LayoutListState extends Equatable {
  const LayoutListState();
}

class LayoutListInitial extends LayoutListState {
  @override
  List<Object> get props => [];
}
class RefreshLayoutState extends LayoutListState{
  @override
  List<Object> get props => [];
}
