import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_mart/bloc/app_state_bloc.dart';
import 'package:hello_mart/core/MyClipper_basic.dart';
import 'package:hello_mart/screens/profile_screen/profile_screen.dart';
import 'package:hello_mart/utils/const_colors.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    // return Padding(
    //   padding: EdgeInsets.symmetric(horizontal: 10.0),
    //   child: Align(
    //     alignment: Alignment.bottomCenter,
    //     child: ClipPath(
    //       clipper: MyClipper(),
    //       child: Container(
    //         margin: EdgeInsets.only(bottom: screenHeight * 0.01),
    //         decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(10.0),
    //             color: Colors.grey.shade300,
    //             boxShadow: [BoxShadow(offset: Offset(1.0, 2.0), color: kPrimaryDark, blurRadius: 3.0)]),
    //         height: screenHeight * 0.08,
    //         width: MediaQuery.of(context).size.width,
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //           children: [
    //             Column(
    //               mainAxisAlignment: MainAxisAlignment.end,
    //               children: [
    //                 InkWell(
    //                   onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProfileScreen())),
    //                   child: Image.asset(
    //                     'assets/icons/user.png',
    //                     height: screenHeight * 0.04,
    //                     width: screenHeight * 0.04,
    //                   ),
    //                 ),
    //                 SizedBox(
    //                   height: screenHeight * 0.01,
    //                 )
    //               ],
    //             ),
    //             Column(
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               children: [
    //                 SizedBox(
    //                   height: screenHeight * 0.01,
    //                 ),
    //                 InkWell(
    //                   onTap: () {
    //                     BlocProvider.of<AppStateBloc>(context).add(ChangeScreen(0));
    //                   },
    //                   child: Image.asset(
    //                     'assets/icons/home.png',
    //                     height: screenHeight * 0.05,
    //                     width: screenHeight * 0.06,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //             Column(
    //               mainAxisAlignment: MainAxisAlignment.end,
    //               children: [
    //                 InkWell(
    //                   onTap: () {
    //                     BlocProvider.of<AppStateBloc>(context).add(ChangeScreen(2));
    //                   },
    //                   child: Image.asset(
    //                     'assets/icons/cart.png',
    //                     height: screenHeight * 0.04,
    //                     width: screenHeight * 0.04,
    //                   ),
    //                 ),
    //                 SizedBox(
    //                   height: screenHeight * 0.01,
    //                 )
    //               ],
    //             )
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.only(bottom: screenHeight * 0.005),
          height: screenHeight * 0.08,
          width: MediaQuery.of(context).size.width * 0.7,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: screenHeight * 0.055,
                      width: MediaQuery.of(context).size.width * 0.60,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), boxShadow: [
                        BoxShadow(offset: Offset(1.0, 2.0), color: Colors.grey.shade500, blurRadius: 3.0)
                      ]),
                    ),
                    SizedBox(
                      height: screenHeight * 0.008,
                    )
                  ],
                ),
              ),
              Align(
                child: Image.asset(
                  'assets/icons/menu.png',
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProfileScreen())),
                        child: Image.asset(
                          'assets/icons/user.png',
                          height: screenHeight * 0.04,
                          width: screenHeight * 0.04,
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: screenHeight * 0.01,
                      ),
                      InkWell(
                        onTap: () {
                          BlocProvider.of<AppStateBloc>(context).add(ChangeScreen(0));
                        },
                        child: Image.asset(
                          'assets/icons/home.png',
                          height: screenHeight * 0.045,
                          width: screenHeight * 0.055,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          BlocProvider.of<AppStateBloc>(context).add(ChangeScreen(2));
                        },
                        child: Image.asset(
                          'assets/icons/cart.png',
                          height: screenHeight * 0.04,
                          width: screenHeight * 0.04,
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
