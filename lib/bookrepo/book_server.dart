import 'package:flutter_reader/bean/book.dart';

abstract class BookServer {
  /// 书籍是否存在
  Future<bool> isBookExist(String bookId);

  /// 获取用户书架书籍信息
  Future<List<Book>> getShelfBooks();

  Future<Book> getBookById(String bookId);

  /// 获取用户历史阅读记录
  Future<List<ReadInfo>> getReadInfos();

  /// 获取最近阅读记录
  Future<ReadInfo> getLastReadInfo();

  /// 根据[bookId]获取阅读记录
  Future<ReadInfo> getReadInfo(String bookId);

  /// 添加书籍到书架
  Future<int> addBookToShelf(Book book);

  /// 删除书架书籍
  Future<int> deleteShelfBook(String bookId);

  /// 更新阅读记录
  Future<bool> updateReadInfo(ReadInfo readInfo);

  /// 增加阅读记录
  Future <int> addReadInfo(ReadInfo readInfo);
}
