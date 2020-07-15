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
