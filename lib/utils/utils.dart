import 'package:flutter_reader/bean/book.dart';

ReadInfo createReadInfo(Book book) {
  int currentTime = DateTime.now().millisecondsSinceEpoch;
  return ReadInfo(
      bookId: book.bookId,
      lastReadTime: currentTime,
      readPosition: 0,
      lastRead: false);
}

