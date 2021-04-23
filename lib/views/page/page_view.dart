import 'dart:ui' as UI;

import 'package:flutter/material.dart';
import 'package:flutter_reader/bean/book.dart';
import 'package:flutter_reader/views/measure_page.dart';
import 'package:flutter_reader/utils/log.dart' as Log;
import 'package:flutter_reader/views/page/book_page_bloc.dart';

class BookPageView extends StatefulWidget {
  ReadInfo info;

  BookPageView({@required this.info});

  @override
  State<StatefulWidget> createState() {
    return _PageState();
  }
}

class _PageState extends State<BookPageView> {
  BookPageBloc _bloc;
  final String TAG = "BookPageView";

  @override
  void initState() {
    super.initState();
    _bloc = new BookPageBloc(readInfo: widget.info);
  }

  void _nextPage() {
    _bloc.nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("xxx"),
      ),
      body: MeasureSize(
        onChange: (size) {
          Log.log(TAG, "book size: $size");
          if (size.width == 0 || size.height == 0) {
            return;
          }
          _bloc.openBook(size);
        },
        child: _bookPage(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _nextPage,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _bookPage() {
    return StreamBuilder(
        stream: _bloc.contentStream,
        builder: (context, snapshot) {
          UI.Image image = snapshot.data;
          if (image == null) {
            return Text("无内容");
          } else {
            return ConstrainedBox(
              constraints: new BoxConstraints.expand(),
              child: CustomPaint(
                foregroundPainter: new ImagePainter(image: image),
              ),
            );
          }
        });
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }
}

class ImagePainter extends CustomPainter {
  UI.Image image;
  var painter = new Paint();

  ImagePainter({this.image});

  @override
  void paint(Canvas canvas, Size size) {
    if (image == null) {
      return;
    }
    var dpr = UI.window.devicePixelRatio;
    canvas.scale(1 / dpr, 1 / dpr);
    canvas.drawImage(image, Offset.zero, painter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
