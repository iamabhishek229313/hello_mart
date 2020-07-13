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
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 10.0),
                //   child: Align(
                //     alignment: Alignment.bottomCenter,
                //     child: Container(
                //       height: screenHeight * 0.08,
                //       // clipBehavior: ,
                //       width: MediaQuery.of(context).size.width * 0.7,
                //       color: Colors.pink,
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //         children: [
                //           IconButton(
                //               icon: Icon(Icons.person),
                //               onPressed: () =>
                //                   Navigator.push(context, MaterialPageRoute(builder: (_) => ProfileScreen()))),
                //           IconButton(icon: Icon(Icons.home), onPressed: () => _changeScreen(0)),
                //           IconButton(icon: Icon(Icons.shopping_cart), onPressed: () => _changeScreen(2))
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ClipPath(
                      clipper: MyClipper(),
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.amber),
                        height: screenHeight * 0.08,
                        width: MediaQuery.of(context).size.width * 0.7,
                        // color: Colors.pink,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                                icon: Icon(Icons.person),
                                onPressed: () =>
                                    Navigator.push(context, MaterialPageRoute(builder: (_) => ProfileScreen()))),
                            Column(
                              children: [
                                SizedBox(height: screenHeight * 0.005),
                                InkWell(
                                  onTap: () => _changeScreen(0),
                                  child: Icon(
                                    Icons.home,
                                    size: screenHeight * 0.065,
                                  ),
                                ),
                              ],
                            ),
                            IconButton(icon: Icon(Icons.shopping_cart), onPressed: () => _changeScreen(2))
                          ],
                        ),
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

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double innerCircleRadius = size.width * 0.1;
    Path path = new Path();
    path.moveTo(0.0, size.height);
    path.lineTo(0.0, 0.0 + size.height * 0.25);
    path.lineTo(size.width / 2 - size.width * 0.1, 0.0 + size.height * 0.25);
    var firstControllpoint = new Offset(size.width / 2 - innerCircleRadius, 0.0);
    var firstEndPoint = new Offset(size.width / 2 + size.width * 0.1, 0.0 + size.height * 0.25);
    path.quadraticBezierTo(firstControllpoint.dx, firstControllpoint.dy, firstEndPoint.dx, firstEndPoint.dy);
    // path.arcToPoint(Offset(size.width - size.width/PolygonClipperConst.RATIO_CLIPPER_VAL + 1 , 2.0), radius: Radius.circular(PolygonClipperConst.RADIUS));
    path.lineTo(size.width / 2 + innerCircleRadius, 0.0 + size.height * 0.25);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
