import 'package:flutter/material.dart';

class BottomWaveClipper extends CustomClipper<Path> {

  double convex;
  BottomWaveClipper({this.convex});

  @override
  Path getClip(Size size) {

    double difference = size.height*0.168;

    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(0, difference);
    path.quadraticBezierTo(size.width/2, size.height - size.height * convex, size.width, difference);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}