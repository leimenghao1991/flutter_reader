import 'package:flutter/foundation.dart';

/// 书籍模型
class Book {
  String bookId;

  /// 书籍名称
  String name;

  /// 书籍大小
  int size;

  /// 封面
  String cover;

  /// 书籍路径
  String path;

  /// 编码
  String encode;

  /// 添加时间
  int addTime;

  Book(
      {@required this.bookId,
      @required this.name,
      @required this.size,
      @required this.cover,
      @required this.path,
      @required this.encode,
      @required this.addTime});

  @override
  String toString() {
    return 'Book{bookId: $bookId, name: $name, size: $size, cover: $cover, path: $path, encode: $encode, addTime: $addTime}';
  }

  bool isValid() => addTime != 0;

  Book.invalid() {
    bookId = "";
    name = "";
    size = 0;
    cover = "";
    path = "";
    encode = "";
    addTime = 0;
  }
}

class ReadInfo {
  /// 阅读书籍id
  String bookId;

  /// 上次阅读时间  ms
  int lastReadTime;

  /// 上次阅读位置
  int readPosition;

  /// 是否是最后阅读的书籍
  bool lastRead;

  ReadInfo(
      {@required this.bookId,
      @required this.lastReadTime,
      @required this.readPosition,
      @required this.lastRead});

  @override
  String toString() {
    return 'ReadInfo{bookId: $bookId, lastReadTime: $lastReadTime, readPosition: $readPosition, lastRead: $lastRead}';
  }
}
