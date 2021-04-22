import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_reader/bean/book.dart';
import 'package:flutter_reader/bookrepo/book_loader.dart';
import 'package:flutter_reader/bookrepo/test_server.dart';

class BookPageBloc {
  static const String TAG = "BookPageBloc";
  LocalBookServer _bookServer = LocalBookServer.getInstance();
  int _perReadLength = 400;
  ReadInfo readInfo;
  BookLoader _bookLoader;
  final StreamController<String> _currentContentSC = StreamController();

  StreamSink<String> get _contentSink => _currentContentSC.sink;

  Stream<String> get contentStream => _currentContentSC.stream;

  BookPageBloc({@required this.readInfo});

  void openBook() async {
    Book info = await _bookServer.getBookById(readInfo.bookId);
    _bookLoader = new BookLoader(bookPath: info.path);
    _bookLoader.init();
    int preReadPos = readInfo.readPosition;
    _readContent(preReadPos, _perReadLength);
  }

  void nextPage() {
    _readContent(readInfo.readPosition + _perReadLength, _perReadLength);
  }

  void _readContent(int start, int readLength) {
    var result = _bookLoader.getBookContent(start, readLength);
    _contentSink.add(result.content);
    _updateReadInfo(result);
  }

  void _updateReadInfo(BookContent content) {
    readInfo.readPosition = content.start;
    readInfo.lastRead = true;
    readInfo.lastReadTime = DateTime.now().millisecondsSinceEpoch;
    _bookServer.updateReadInfo(readInfo);
  }

  void dispose() {
    _currentContentSC.close();
    _bookLoader?.dispose();
  }
}
