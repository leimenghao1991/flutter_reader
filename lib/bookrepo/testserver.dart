
import 'package:flutter_reader/bean/book.dart';
import 'package:flutter_reader/bookrepo/bookserver.dart';

import '../db/database.dart';

class TestBookServer implements BookServer {
  final db = Database();

  @override
  Future<bool> addBookToShelf(Book book) {
    // return db.insertBook(BookIn)
  }

  @override
  Future<bool> deleteShelfBook(String bookId) {
    // TODO: implement deleteShelfBook
    throw UnimplementedError();
  }

  @override
  Future<ReadInfo> getLastReadInfo() {
    // TODO: implement getLastReadInfo
    throw UnimplementedError();
  }

  @override
  Future<ReadInfo> getReadInfo(String bookId) {
    // TODO: implement getReadInfo
    throw UnimplementedError();
  }

  @override
  Future<List<ReadInfo>> getReadInfos() {
    // TODO: implement getReadInfos
    throw UnimplementedError();
  }

  @override
  Future<List<Book>> getShelfBooks() {
    // TODO: implement getShelfBooks
    throw UnimplementedError();
  }

  @override
  Future<bool> updateReadInfo(ReadInfo readInfo) {
    // TODO: implement updateReadInfo
    throw UnimplementedError();
  }

}