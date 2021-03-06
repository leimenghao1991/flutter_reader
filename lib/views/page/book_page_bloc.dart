import 'dart:async';
import 'dart:convert';
import 'dart:ui' as UI;

import 'package:flutter/cupertino.dart';
import 'package:flutter_reader/bean/book.dart';
import 'package:flutter_reader/utils/log.dart' as Log;
import 'package:flutter_reader/bookrepo/book_loader.dart';
import 'package:flutter_reader/bookrepo/test_server.dart';
import 'package:flutter_reader/views/page/drawer_builder.dart';
import 'package:flutter_reader/views/page/page_drawer.dart';
import 'package:flutter_reader/views/page/text_measure.dart';

class BookPageBloc {
  static const String TAG = "BookPageBloc";
  LocalBookServer _bookServer = LocalBookServer.getInstance();
  int _currentShowLength = 0;
  ReadInfo readInfo;
  _PageContentLoader _pageLoader = new _PageContentLoader();

  Size _size;
  final StreamController<UI.Image> _currentContentSC = StreamController();

  StreamSink<UI.Image> get _contentSink => _currentContentSC.sink;

  Stream<UI.Image> get contentStream => _currentContentSC.stream;

  BookPageBloc({@required this.readInfo});

  void openBook(Size size) async {
    _size = size;
    Book info = await _bookServer.getBookById(readInfo.bookId);
    _pageLoader.init(info.path);
    _readContent(0, _perReadLength);
  }

  void nextPage() {
    _readContent(readInfo.readPosition + _currentShowLength, _perReadLength);
  }

  void _readContent(int start, int readLength) async {
    var result = await _bookLoader.getBookContent(start, readLength);
    _createContentImage(result.content);
    _updateReadInfo(result);
  }

  void _createContentImage(String content) async {
    DrawerBuilder builder = new DrawerBuilder(_size);
    BackgroundDrawer bgDrawer = BackgroundDrawer();
    builder.add(bgDrawer);
    TextDrawer drawer = TextDrawer(
        content: content,
        onDrawLength: (length) {
          _currentShowLength =
              Utf8Codec().encode(content.substring(0, length)).length;
        });
    builder.add(drawer);
    UI.Image image = await builder.build();
    _contentSink.add(image);
  }

  void _updateReadInfo(BookContent content) {
    readInfo.readPosition = content.start;
    readInfo.lastRead = true;
    readInfo.lastReadTime = DateTime.now().millisecondsSinceEpoch;
    _bookServer.updateReadInfo(readInfo);
  }

  void dispose() {
    _currentContentSC.close();
    _pageLoader?.dispose();
  }
}

class _PageContentLoader {
  BookLoader _bookLoader;
  TextMeasure _measure = new TextMeasure.getInstance();
  Size _size;
  int _perReadLength = 2048;

  init(String bookPath) async {
    _bookLoader = new BookLoader(bookPath: bookPath);
    _bookLoader.init();
  }

  setPageSize(Size size) {
    _size = size;
  }

  loadPageContent() {
    
  }

  void dispose() {
    _bookLoader.dispose();
  }
}
