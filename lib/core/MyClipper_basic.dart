import 'package:flutter/material.dart';

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double rad = size.width * 0.25 / 2;
    final double deepness = size.height * 0.28;
    final Offset _controlPoint = Offset(size.width / 2, -deepness);
    final Offset _endPoint = Offset(size.width / 2 + rad, deepness);

    return Path()
      ..moveTo(0.0, deepness)
      ..lineTo(size.width / 2 - rad, deepness)
      // Have to add beizer there.
      ..quadraticBezierTo(_controlPoint.dx, _controlPoint.dy, _endPoint.dx, _endPoint.dy)
      //
      ..lineTo(size.width / 2 - rad * 2, deepness)
      ..lineTo(size.width, deepness)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
