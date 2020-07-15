import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_mart/bloc/app_state_bloc.dart';
import 'package:hello_mart/core/bottom_nav_bar.dart';

class StateWrapper extends StatefulWidget {
  @override
  _StateWrapperState createState() => _StateWrapperState();
}

class _StateWrapperState extends State<StateWrapper> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: screenHeight - topPadding,
            child: Column(
              children: [
                // States will go here.
                BlocBuilder<AppStateBloc, AppState>(
                  builder: (BuildContext context, AppState appState) {
                    return Expanded(child: appState.widget);
                  },
                ),
                BottomNavBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
