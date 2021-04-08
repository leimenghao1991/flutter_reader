import 'package:flutter/foundation.dart';

/// 书籍模型
class Book {
  String bookId;

  /// 书籍名称
  String name;

  /// 书籍大小
  num size;

  /// 封面
  String cover;

  /// 书籍路径
  String path;

  /// 编码
  String encode;

  /// 添加时间
  num addTime;

  Book(
      {@required this.bookId,
      @required this.name,
      @required this.size,
      @required this.cover,
      @required this.path,
      @required this.encode,
      @required this.addTime});
}

class ReadInfo {
  /// 阅读书籍id
  String bookId;

  /// 上次阅读时间  ms
  num lastReadTime;

  /// 上次阅读位置
  num readPosition;

  /// 是否是最后阅读的书籍
  bool lastRead;

  ReadInfo(
      {@required this.bookId,
      @required this.lastReadTime,
      @required this.readPosition,
      @required this.lastRead});
}
