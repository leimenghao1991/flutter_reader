import '../bean/book.dart';
import '../bean/book.dart';
import '../bean/book.dart';
import '../db/database.dart';
import '../db/database.dart';
import '../db/database.dart';
import '../db/database.dart';
import '../db/database.dart';

Book parseToBook(BookInfo info) {
  return Book(
      bookId: info.bookId,
      name: info.name,
      size: info.size,
      cover: info.cover,
      path: info.path,
      encode: info.encode,
      addTime: info.addTime);
}

BookInfo parseToBookInfo(Book book) {
  return BookInfo(
      bookId: book.bookId,
      name: book.name,
      size: book.size,
      cover: book.cover,
      path: book.path,
      encode: book.encode,
      addTime: book.addTime);
}

ReadInfo parseToReadInfo(ReadHistory history) {
  return ReadInfo(
      bookId: history.bookId,
      lastReadTime: history.readTime,
      readPosition: history.readPosition,
      lastRead: history.lastRead);
}

ReadHistory parseToHistory(ReadInfo info) {
  return ReadHistory(
      bookId: info.bookId,
      readTime: info.lastReadTime,
      readPosition: info.readPosition,
      lastRead: info.lastRead);
}
