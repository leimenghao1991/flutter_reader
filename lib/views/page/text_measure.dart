import 'dart:ui';

import 'package:flutter/material.dart';

class TextMeasure {
  static TextMeasure _instance;


  TextMeasure._internal();

  factory TextMeasure.getInstance() => _getInstance();

  static _getInstance() {
    if (_instance == null) {
      _instance = TextMeasure._internal();
    }
    return _instance;
  }

  String getProperContent(String content, Size size, TextStyle style) {
    if (content == null || content.isEmpty) {
      return "";
    }
    TextSpan span = TextSpan(text: content, style: style);
    TextPainter painter = TextPainter(text: span, textDirection: TextDirection.ltr);

    painter.layout(minWidth: size.width, maxWidth: size.width);
    List<LineMetrics> lineMetrics = painter.computeLineMetrics();

    double lineHeight = 0;
    for (LineMetrics metrics in lineMetrics) {
      if (lineHeight + metrics.height > size.height) {
        break;
      }
      lineHeight += metrics.height;
    }
    TextPosition position = painter.getPositionForOffset(new Offset(size.width, lineHeight));
    if (position.offset > content.length) {
      return content;
    }
    return content.substring(0, position.offset);
  }
}
