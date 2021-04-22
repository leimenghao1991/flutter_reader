import 'package:flutter/material.dart';
import 'package:flutter_reader/views/shelf/book_info.dart';
import 'package:flutter_reader/views/shelf/shelf_bloc.dart';

class ShelfView extends StatefulWidget {
  final ShelfBloc bloc;

  ShelfView({Key key, @required this.bloc}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ShelfViewState();
  }
}

class _ShelfViewState extends State<ShelfView> {
  num bookCoverMaxWidth = 200;

  @override
  void initState() {
    super.initState();
    widget.bloc.queryAllBooks();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: widget.bloc.books,
        builder: (context, snapshot) {
          List<BookWithInfo> books = snapshot.data;
          if (books != null && books.isNotEmpty) {
            return booksGrid(books);
          } else {
            // show empty view
            return Text("No Book!");
          }
        });
  }

  Widget booksGrid(List<BookWithInfo> books) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 0.707),
        itemCount: books.length,
        itemBuilder: (context, index) {
          return Container(
            child: ShelfBookWidget(
              book: books[index].book,
              readInfo: books[index].info,
            ),
            margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
          );
        });
  }

  @override
  void dispose() {
    super.dispose();
    widget.bloc.dispose();
  }
}
