import 'package:flutter_reader/bean/book.dart';
import 'package:flutter_reader/bookrepo/book_server.dart';
import 'parser.dart' as parser;
import '../db/database.dart';

class LocalBookServer implements BookServer {
  final db = Database();

  @override
  Future<int> addBookToShelf(Book book) {
    BookInfo info = parser.parseToBookInfo(book);
    return db.insertBook(info);
  }

  @override
  Future<int> deleteShelfBook(String bookId) {
    return db.deleteBookById(bookId);
  }

  @override
  Future<ReadInfo> getLastReadInfo() {
    return db.getLastReadInfo().then((value) => parser.parseToReadInfo(value));
  }

  @override
  Future<ReadInfo> getReadInfo(String bookId) {
    return db
        .getHistoryByBookId(bookId)
        .then((value) => parser.parseToReadInfo(value));
  }

  @override
  Future<List<ReadInfo>> getReadInfos() {
    return db.getAllReadInfos().then((histories) =>
        histories.map((history) => parser.parseToReadInfo(history)).toList());
  }

  @override
  Future<List<Book>> getShelfBooks() {
    return db.getAllBookInfos().then((bookInfos) =>
        bookInfos.map((bookInfo) => parser.parseToBook(bookInfo)).toList());
  }

  @override
  Future<bool> updateReadInfo(ReadInfo readInfo) {
    return db.updateReadInfo(parser.parseToHistory(readInfo));
  }

  @override
  Future<int> addReadInfo(ReadInfo readInfo) {
    return db.insertReadInfo(parser.parseToHistory(readInfo));
  }

  @override
  Future<bool> isBookExist(String bookId) {
    return db.bookExist(bookId);
  }
}
