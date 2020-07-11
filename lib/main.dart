import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_mart/bloc/app_state_bloc.dart';
import 'package:hello_mart/screens/splash_screen.dart';
import 'package:hello_mart/utils/const_colors.dart';
import 'package:provider/provider.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (BuildContext context) => AppStateBloc()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Hello Mart',
          theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: SplashScreen()),
    );
  }
}
