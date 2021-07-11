part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}
class RefreshHomeState extends HomeState{
  @override
  List<Object> get props => [];
}
class LightThemeState extends HomeState{
  @override
  List<Object> get props => [];
}

class DarkThemeState extends HomeState{
  @override
  List<Object> get props => [];
}
class BlueThemeState extends HomeState{
  @override
  List<Object> get props => [];
}
class GoldDarkThemeState extends HomeState{
  @override
  List<Object> get props => [];
}
class NormalStyleState extends HomeState{
  @override
  List<Object> get props => [];
}
class ItalicStyleState extends HomeState{
  @override
  List<Object> get props => [];
}
class BoldStyleState extends HomeState{
  @override
  List<Object> get props => [];
}

class DefaultTypographyState extends HomeState{
  @override
  List<Object> get props => [];
}
class MulishTypographyState extends HomeState{
  @override
  List<Object> get props => [];
}
class NunitoTypographyState extends HomeState{
  @override
  List<Object> get props => [];
}