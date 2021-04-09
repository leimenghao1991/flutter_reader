import 'package:flutter_reader/bean/book.dart';
import 'package:flutter_reader/bookrepo/testserver.dart';

class TestController {
  final LocalBookServer _localBookServer = LocalBookServer();
  int _bookId = 0;

  Future<void> addBook() async {
    Book book = _createBook();
    await _localBookServer.addBookToShelf(book);
    List<Book> books = await _localBookServer.getShelfBooks();
    books.forEach((eachBook) {
      print(eachBook);
    });
  }

  Book _createBook() {
    _bookId++;
    return Book(
        bookId: "$_bookId",
        name: "Book$_bookId",
        size: 1000 * _bookId,
        cover: "Cover$_bookId",
        path: "Book/$_bookId",
        encode: "utf-8",
        addTime: 1000 + _bookId);
  }
}
