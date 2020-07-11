import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_mart/bloc/app_state_bloc.dart';
import 'package:hello_mart/screens/home_screen.dart';
import 'package:hello_mart/screens/profile_screen/profile_screen.dart';

class StateWrapper extends StatefulWidget {
  @override
  _StateWrapperState createState() => _StateWrapperState();
}

class _StateWrapperState extends State<StateWrapper> {
  int _selectedPage = 0; // home.

  _changeScreen(int index) {
    BlocProvider.of<AppStateBloc>(context).add(ChangeScreen(index));
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
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
                // This is custom bottom navigation bar.
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: screenHeight * 0.08,
                      color: Colors.pink,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                              icon: Icon(Icons.person),
                              onPressed: () =>
                                  Navigator.push(context, MaterialPageRoute(builder: (_) => ProfileScreen()))),
                          IconButton(icon: Icon(Icons.home), onPressed: () => _changeScreen(0)),
                          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () => _changeScreen(2))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
