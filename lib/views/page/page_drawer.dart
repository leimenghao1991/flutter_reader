import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_reader/views/page/drawer_builder.dart';
class TextDrawer extends ContentDrawer {
  String content;
  TextStyle style;
  OnDrawLength onDrawLength;

  TextDrawer({@required this.content, this.style, this.onDrawLength});

  @override
  void paint(Canvas canvas, Size size) {
    TextStyle txStyle = style ?? new TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600);
    TextSpan textSpan = TextSpan(text: content, style: txStyle);
    TextPainter textPainter = TextPainter(text: textSpan, textDirection: TextDirection.ltr);

    textPainter.layout(minWidth: 0, maxWidth: size.width);
    textPainter.paint(canvas, Offset.zero);
    TextPosition position =
        textPainter.getPositionForOffset(new Offset(size.width, size.height));
    onDrawLength?.call(position.offset);
  }
}

/// 绘制的字符串长度为[length]
typedef OnDrawLength = Function(int length);

class BackgroundDrawer extends ContentDrawer {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Colors.blue, BlendMode.color);
  }

}
