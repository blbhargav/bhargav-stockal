import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if(event is RefreshHomeStateEvent){
      yield HomeInitial();
      yield RefreshHomeState();
    }else if(event is LightThemeEvent){
      yield LightThemeState();
    }else if(event is DarkThemeEvent){
      yield DarkThemeState();
    }else if(event is BlueThemeEvent){
      yield BlueThemeState();
    }else if(event is GoldDarkThemeEvent){
      yield GoldDarkThemeState();
    }else if(event is NormalStyleEvent){
      yield NormalStyleState();
    }else if(event is ItalicStyleEvent){
      yield ItalicStyleState();
    }else if(event is BoldStyleEvent){
      yield BoldStyleState();
    }else if(event is DefaultTypographyEvent){
      yield DefaultTypographyState();
    }else if(event is MulishTypographyEvent){
      yield MulishTypographyState();
    }else if(event is NunitoTypographyEvent){
      yield NunitoTypographyState();
    }
  }
}
