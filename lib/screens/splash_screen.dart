import 'package:flutter/material.dart';
import 'package:hello_mart/screens/state_wrapper.dart';
import 'package:hello_mart/utils/const_colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 3000), () {
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (_) => StateWrapper()));
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kPrimaryDark,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Image(
            image: AssetImage('assets/images/logo_png.png'),
            height: screenHeight * 0.4,
            width: screenWidth * 0.8,
            color: kGreyDark,
            fit: BoxFit.cover,
          ),
          Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "Designed and Developed by AS Designs",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.0, color: kGreyDark),
            ),
          )
        ],
      ),
    );
  }
}
