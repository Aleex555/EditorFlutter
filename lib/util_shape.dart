import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Shape {
  Offset position = const Offset(0, 0);
  Size scale = const Size(1, 1);
  double rotation = 0;
  List<Offset> points = [];
  double stroke = 1;
  Color color = Colors.black;

  Shape();

  void setColor(Color newColor) {
    color = newColor;
  }

  void setPosition(Offset newPosition) {
    position = newPosition;
  }

  void setStrokeWidth(double size) {
    stroke = size;
  }

  void setScale(Size newScale) {
    scale = newScale;
  }

  void setRotation(double newRotation) {
    rotation = newRotation;
  }

  void addPoint(Offset point) {
    points.add(Offset(point.dx, point.dy));
  }

  void addRelativePoint(Offset point) {
    points.add(Offset(point.dx - position.dx, point.dy - position.dy));
  }
}
