import 'package:flutter_reader/bean/book.dart';
import 'package:flutter_reader/bookrepo/book_server.dart';
import 'parser.dart' as parser;
import '../db/database.dart';

class LocalBookServer implements BookServer {
  static LocalBookServer _instance;

  final _db = Database();

  LocalBookServer._internal();

  factory LocalBookServer.getInstance() => _getInstance();

  static _getInstance() {
    if (_instance == null) {
      _instance = LocalBookServer._internal();
    }
    return _instance;
  }

  @override
  Future<int> addBookToShelf(Book book) {
    BookInfo info = parser.parseToBookInfo(book);
    return _db.insertBook(info);
  }

  @override
  Future<int> deleteShelfBook(String bookId) {
    return _db.deleteBookById(bookId);
  }

  @override
  Future<ReadInfo> getLastReadInfo() {
    return _db.getLastReadInfo().then((value) => parser.parseToReadInfo(value));
  }

  @override
  Future<ReadInfo> getReadInfo(String bookId) {
    return _db
        .getHistoryByBookId(bookId)
        .then((value) => parser.parseToReadInfo(value));
  }

  @override
  Future<List<ReadInfo>> getReadInfos() {
    return _db.getAllReadInfos().then((histories) =>
        histories.map((history) => parser.parseToReadInfo(history)).toList());
  }

  @override
  Future<List<Book>> getShelfBooks() {
    return _db.getAllBookInfos().then((bookInfos) =>
        bookInfos.map((bookInfo) => parser.parseToBook(bookInfo)).toList());
  }

  @override
  Future<Book> getBookById(String bookId) {
    return _db.getBookById(bookId).then((bookInfo) => parser.parseToBook(bookInfo));
  }

  @override
  Future<bool> updateReadInfo(ReadInfo readInfo) {
    return _db.updateReadInfo(parser.parseToHistory(readInfo));
  }

  @override
  Future<int> addReadInfo(ReadInfo readInfo) {
    return _db.insertReadInfo(parser.parseToHistory(readInfo));
  }

  @override
  Future<bool> isBookExist(String bookId) {
    return _db.bookExist(bookId);
  }
}
