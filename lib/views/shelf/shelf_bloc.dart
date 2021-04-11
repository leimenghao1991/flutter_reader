import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_reader/bean/book.dart';
import 'package:flutter_reader/bookrepo/testserver.dart';
import 'package:flutter_reader/utils/log.dart' as Log;
import 'package:flutter_reader/utils/utils.dart';

class ShelfBloc {
  static const String TAG = "ShelfBloc";
  final LocalBookServer _localBookServer = LocalBookServer();
  final StreamController<List<BookWithInfo>> _shelfBooksSC = StreamController();

  Stream<List<BookWithInfo>> get books => _shelfBooksSC.stream;

  Future<void> addBook(Book book) async {
    if (!book.isValid()) {
      Log.log(TAG, "add book failed as book is invalid");
      return;
    }

    bool exist = await _localBookServer.isBookExist(book.bookId);
    if (exist) {
      Log.log(TAG, "add book failed as book has already added");
      return;
    }

    await _localBookServer.addBookToShelf(book);
    ReadInfo readInfo = createReadInfo(book);
    await _localBookServer.addReadInfo(readInfo);

    queryAllBooks();
  }

  Future<void> queryAllBooks() async {
    List<Book> books = await _localBookServer.getShelfBooks();
    List<ReadInfo> infos = await _localBookServer.getReadInfos();
    List<BookWithInfo> result = [];

    for (Book book in books) {
      ReadInfo find = infos.firstWhere((info) => book.bookId == info.bookId,
          orElse: () => null);
      if (find == null) {
        Log.log(TAG, "$book has no read info");
        continue;
      }
      result.add(BookWithInfo(book: book, info: find));
    }
    result.sort((bookWithInfo1, bookWithInfo2) {
      ReadInfo info1  = bookWithInfo1.info;
      ReadInfo info2 = bookWithInfo2.info;
      return info1.lastReadTime.compareTo(info2.lastReadTime);
    });
    _shelfBooksSC.sink.add(result);
  }

  void dispose() {
    _shelfBooksSC.close();
  }
}

class BookWithInfo {
  final Book book;
  final ReadInfo info;

  BookWithInfo({@required this.book, @required this.info});
}
