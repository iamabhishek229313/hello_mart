import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:hello_mart/screens/cart_screen/confirm_order_Screen.dart';
import 'package:hello_mart/screens/home_screen.dart';
import 'package:hello_mart/screens/profile_screen/profile_screen.dart';

class AppState {
  final int index;
  final Widget widget;

  AppState(this.index, this.widget);
}

class AppStateEvent {}

class ChangeScreen extends AppStateEvent {
  final int index;

  ChangeScreen(this.index);
}

class AppStateBloc extends Bloc<AppStateEvent, AppState> {
  AppStateBloc() : super(AppState(0, HomeScreen()));

  @override
  Stream<AppState> mapEventToState(AppStateEvent event) async* {
    if (event is ChangeScreen) {
      switch (event.index) {
        case 0:
          yield AppState(0, HomeScreen());
          break;
        case 1:
          yield AppState(1, ProfileScreen());
          break;
        case 2:
          yield AppState(2, ConfirmOrderScreen());
          break;
      }
    }
  }
}
