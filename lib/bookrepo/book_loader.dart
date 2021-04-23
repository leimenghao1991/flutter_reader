import 'dart:convert';
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

  void init() {
    try {
      _fileContentLength = _bookFile.lengthSync();
      _readFile = _bookFile.openSync(mode: FileMode.read);
      print("read file is: $_readFile");
    } catch (e) {
      Log.log(TAG, "book loader init failed. $e");
    }
  }

  Future<BookContent> getBookContent(int start, int length) async {
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

    await _readFile.setPosition(startPos);
    Uint8List read = await _readFile.read(readLength);
    // 找到utf8的编码结束位置
    int endPos = _findEndPosition(read);

    String content = Utf8Codec().decode(read.sublist(0, endPos));
    return BookContent(content: content, start: startPos, length: endPos);
  }

  int _findEndPosition(Uint8List bytes) {
    int length = bytes.length;
    int index = length - 1;
    int endPos = 0;
    while(index >= 0) {
      int charByte = bytes[index];
      int charLength = getUtf8CodeCharLength(charByte);
      if(charLength != 0 && index + charLength < length) {
        endPos = index + charLength;
        break;
      }
      index--;
    }
    return endPos;
  }

  int getUtf8CodeCharLength(int byte) {
    int length = 0;
    if(byte >= 0xFC) {
      length = 6;
    } else if (byte >= 0xF8) {
      length = 5;
    } else if (byte >= 0xF0) {
      length = 4;
    } else if (byte >= 0xE0) {
      length = 3;
    } else if (byte >= 0xC0) {
      length = 2;
    } else if (byte & 0x80 == 0){
      length = 1;
    }
    return length;
  }

  bool _checkPositionValid(int position) {
    return position >= 0 && position < _fileContentLength;
  }

  void dispose() async {
    await _readFile?.close();
    await _bookFile?.setLastAccessed(DateTime.now());
  }
}

class BookContent {
  String content;
  int start;
  int length;

  BookContent(
      {@required this.content, @required this.start, @required this.length});
}
