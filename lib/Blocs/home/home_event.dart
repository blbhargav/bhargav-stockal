part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class InitEvent extends HomeEvent{
  @override
  List<Object> get props => [];
}

class RefreshHomeStateEvent extends HomeEvent{
  @override
  List<Object> get props => [];
}
class LightThemeEvent extends HomeEvent{
  @override
  List<Object> get props => [];
}
class DarkThemeEvent extends HomeEvent{
  @override
  List<Object> get props => [];
}
class BlueThemeEvent extends HomeEvent{
  @override
  List<Object> get props => [];
}
class GoldDarkThemeEvent extends HomeEvent{
  @override
  List<Object> get props => [];
}

class NormalStyleEvent extends HomeEvent{
  @override
  List<Object> get props => [];
}

class ItalicStyleEvent extends HomeEvent{
  @override
  List<Object> get props => [];
}

class BoldStyleEvent extends HomeEvent{
  @override
  List<Object> get props => [];
}

class DefaultTypographyEvent extends HomeEvent{
  @override
  List<Object> get props => [];
}
class MulishTypographyEvent extends HomeEvent{
  @override
  List<Object> get props => [];
}
class NunitoTypographyEvent extends HomeEvent{
  @override
  List<Object> get props => [];
}