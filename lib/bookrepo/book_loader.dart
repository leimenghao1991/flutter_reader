import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_reader/utils/log.dart' as Log;

class BookLoader {
  static const String TAG = "BookLoader";
  static const int INVALID_LENGTH = -1;

  String bookPath;
  File _bookFile;
  RandomAccessFile _readFile;

  int _fileContentLength = INVALID_LENGTH;

  BookLoader({@required this.bookPath}) {
    _bookFile = new File(bookPath);
  }

  Future<bool> init() async {
    try {
      _fileContentLength = _bookFile.lengthSync();
      _readFile = _bookFile.openSync(mode: FileMode.read);
      print("read file is: $_readFile");
    } catch (e) {
      Log.log(TAG, "book loader init failed. $e");
    }
  }

  BookContent getBookContent(int start, int length) {
    int startPos = start;
    if (!_checkPositionValid(startPos)) {
      startPos = 0;
    }
    int readLength = length;
    if (readLength < 0) {
      readLength = 0;
    }
    if (startPos + readLength > _fileContentLength) {
      readLength = _fileContentLength - startPos;
    }
    if (readLength == 0) {
      return BookContent(content: "", start: startPos, length: readLength);
    }
    _readFile.setPosition(startPos);
    Uint8List read = _readFile.readSync(readLength);
    String content = new String.fromCharCodes(read);
    return BookContent(content: content, start: startPos, length: readLength);
  }

  bool _checkPositionValid(int position) {
    return position >= 0 && position < _fileContentLength;
  }

  void dispose() {
    _readFile?.close();
    _bookFile?.setLastAccessedSync(DateTime.now());
  }
}

class BookContent {
  String content;
  int start;
  int length;

  BookContent(
      {@required this.content, @required this.start, @required this.length});
}
