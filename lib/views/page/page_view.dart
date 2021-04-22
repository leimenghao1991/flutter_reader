import 'package:flutter/material.dart';
import 'package:flutter_reader/bean/book.dart';
import 'package:flutter_reader/views/page/book_page_bloc.dart';

class BookPageView extends StatefulWidget {
  ReadInfo info;

  BookPageView({@required this.info});

  @override
  State<StatefulWidget> createState() {
    return _PageState();
  }
}

class _PageState extends State<BookPageView> {
  BookPageBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = new BookPageBloc(readInfo: widget.info);
    _bloc.openBook();
  }

  void _nextPage() {
    _bloc.nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("xxx"),
      ),
      body: _bookPage(),
      floatingActionButton: FloatingActionButton(
        onPressed: _nextPage,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _bookPage() {
    return StreamBuilder(
        stream: _bloc.contentStream,
        builder: (context, snapshot) {
          String content = snapshot.data;
          if (content == null || content.isEmpty) {
            return Text("无内容");
          } else {
            return Center(
              // Center is a layout widget. It takes a single child and positions it
              // in the middle of the parent.
              child: Text(content),
            );
          }
        });
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }
}
