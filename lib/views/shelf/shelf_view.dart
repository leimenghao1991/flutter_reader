import 'package:flutter/material.dart';
import 'package:flutter_reader/views/shelf/bookinfo.dart';

import '../../bean/book.dart';
import '../../bean/book.dart';

class ShelfView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ShelfViewState();
  }
}

int randomIndex = 0;

Book createBook(String bookName) {
  randomIndex++;
  return Book(
      bookId: "$randomIndex",
      name: bookName,
      size: 100000,
      cover: "",
      path: "",
      encode: "",
      addTime: 100);
}

ReadInfo createReadInfo(String bookId) {
  randomIndex++;
  return ReadInfo(
      bookId: bookId,
      lastReadTime: 0,
      readPosition: randomIndex * 1000,
      lastRead: false);
}

class _ShelfViewState extends State<ShelfView> {
  num bookCoverMaxWidth = 200;

  List<Book> books = [
    createBook("语文"),
    createBook("十年高考三年模拟"),
    createBook("理综"),
    createBook("超级长的书名超级长的书名超级长的书名超级长的书名超级长的书名超级长的书名"),
  ];
  ReadInfo info = createReadInfo("book1.bookId");

  num getBookCoverSpace(num shelfWidth) {
    return (shelfWidth - bookCoverMaxWidth * 3) / 4;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 0.707),
        itemCount: books.length,
        itemBuilder: (context, index) {
          return Container(
            child: ShelfBookWidget(
              book: books[index],
              readInfo: info,
            ),
            margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
          );
        });
  }
}
