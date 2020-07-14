import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_mart/bloc/app_state_bloc.dart';
import 'package:hello_mart/core/MyClipper_basic.dart';
import 'package:hello_mart/screens/profile_screen/profile_screen.dart';
import 'package:hello_mart/utils/const_colors.dart';

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
                        margin: EdgeInsets.only(bottom: screenHeight * 0.01),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey.shade300,
                            boxShadow: [BoxShadow(offset: Offset(1.0, 2.0), color: kPrimaryDark, blurRadius: 3.0)]),
                        height: screenHeight * 0.08,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    icon: Icon(
                                      Icons.person,
                                      size: 32.0,
                                    ),
                                    onPressed: () =>
                                        Navigator.push(context, MaterialPageRoute(builder: (_) => ProfileScreen()))),
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    _changeScreen(0);
                                  },
                                  child: Icon(
                                    Icons.home,
                                    size: screenHeight * 0.065,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    icon: Icon(
                                      Icons.shopping_cart,
                                      size: 32.0,
                                    ),
                                    onPressed: () => _changeScreen(2)),
                              ],
                            )
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

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double rad = size.width * 0.25 / 2;
    final double deepness = size.height * 0.28;
    final Offset _controlPoint = Offset(size.width / 2, -deepness);
    final Offset _endPoint = Offset(size.width / 2 + rad, deepness);

    final path = Path()
      ..moveTo(0.0, deepness)
      ..lineTo(size.width / 2 - rad, deepness)
      // Have to add beizer there.
      ..quadraticBezierTo(_controlPoint.dx, _controlPoint.dy, _endPoint.dx, _endPoint.dy)
      //
      ..lineTo(size.width / 2 - rad * 2, deepness)
      ..lineTo(size.width, deepness)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);

    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0
      ..color = Colors.black;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

// class MyClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final double innerCircleRadius = size.width * 0.1;
//     Path path = new Path();
//     path.moveTo(0.0, size.height);
//     path.lineTo(0.0, 0.0 + size.height * 0.25);
//     path.lineTo(size.width / 2 - size.width * 0.1, 0.0 + size.height * 0.25);
//     var firstControllpoint = new Offset(size.width / 2 - innerCircleRadius, 0.0);
//     var firstEndPoint = new Offset(size.width / 2 + size.width * 0.1, 0.0 + size.height * 0.25);
//     path.quadraticBezierTo(firstControllpoint.dx, firstControllpoint.dy, firstEndPoint.dx, firstEndPoint.dy);
//     // path.arcToPoint(Offset(size.width - size.width/PolygonClipperConst.RATIO_CLIPPER_VAL + 1 , 2.0), radius: Radius.circular(PolygonClipperConst.RADIUS));
//     path.lineTo(size.width / 2 + innerCircleRadius, 0.0 + size.height * 0.25);
//     path.lineTo(size.width, size.height * 0.25);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0.0, size.height);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper oldClipper) {
//     return true;
//   }
// }
