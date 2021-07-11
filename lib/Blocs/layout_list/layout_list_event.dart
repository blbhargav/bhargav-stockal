part of 'layout_list_bloc.dart';

abstract class LayoutListEvent extends Equatable {
  const LayoutListEvent();
}
class RefreshLayoutStateEvent extends LayoutListEvent{
  @override
  List<Object> get props => [];
}