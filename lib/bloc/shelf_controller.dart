import 'package:flutter_reader/bean/book.dart';
import 'package:flutter_reader/bookrepo/testserver.dart';

class ShelfController {
  final LocalBookServer _localBookServer = LocalBookServer();

  Future<void> addBook(Book book) async {
    if (!book.isValid()) {
      return;
    }
    await _localBookServer.addBookToShelf(book);
    List<Book> books = await _localBookServer.getShelfBooks();
    books.forEach((eachBook) {
      print(eachBook);
    });
  }
}
