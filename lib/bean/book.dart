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
}
