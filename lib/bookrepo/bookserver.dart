import 'package:flutter_reader/bean/book.dart';

abstract class BookServer {
  /// 获取用户书架书籍信息
  Future<List<Book>> getShelfBooks();

  /// 获取用户历史阅读记录
  Future<List<ReadInfo>> getReadInfos();

  /// 获取最近阅读记录
  Future<ReadInfo> getLastReadInfo();

  /// 根据[bookId]获取阅读记录
  Future<ReadInfo> getReadInfo(String bookId);

  /// 添加书籍到书架
  Future<bool> addBookToShelf(Book book);

  /// 删除书架书籍
  Future<bool> deleteShelfBook(String bookId);

  /// 更新阅读记录
  Future<bool> updateReadInfo(ReadInfo readInfo);
}
