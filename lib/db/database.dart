import 'dart:io';

import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

@DataClassName("BookInfo")
class BookInfos extends Table {
  TextColumn get bookId => text()();

  TextColumn get name => text()();

  IntColumn get size => integer()();

  TextColumn get cover => text()();

  TextColumn get path => text()();

  TextColumn get encode => text()();

  IntColumn get addTime => integer()();

  @override
  Set<Column> get primaryKey => {bookId};
}

@DataClassName("ReadHistory")
class ReadHistories extends Table {
  TextColumn get bookId => text()();

  IntColumn get readTime => integer()();

  IntColumn get readPosition => integer()();

  BoolColumn get lastRead => boolean()();

  @override
  Set<Column> get primaryKey => {bookId};
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, "db.sqlite"));
    return VmDatabase(file);
  });
}

@UseMoor(tables: [BookInfos, ReadHistories])
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<bool> bookExist(String bookId) {
    return (select(bookInfos)..where((tbl) => tbl.bookId.equals(bookId)))
        .getSingleOrNull()
        .then((result) => result != null);
  }

  Future insertBook(BookInfo book) {
    return into(bookInfos).insertOnConflictUpdate(book.toCompanion(false));
  }

  Future<List<BookInfo>> getAllBookInfos() {
    return select(bookInfos).get();
  }

  Future updateBook(BookInfo book) {
    return update(bookInfos).replace(book);
  }

  Future deleteBook(BookInfo book) {
    return delete(bookInfos).delete(book);
  }

  Future getBookById(String bookId) {
    return ((select(bookInfos))..where((tbl) => tbl.bookId.equals(bookId)))
        .getSingleOrNull();
  }

  Future deleteBookById(String id) {
    return (delete(bookInfos)..where((tbl) => tbl.bookId.equals(id))).go();
  }

  Future insertReadInfo(ReadHistory history) {
    return into(readHistories)
        .insertOnConflictUpdate(history.toCompanion(false));
  }

  Future<List<ReadHistory>> getAllReadInfos() {
    return select(readHistories).get();
  }

  Future<ReadHistory> getLastReadInfo() {
    return (select(readHistories)
          ..orderBy([(row) => OrderingTerm.desc(row.readTime)])
          ..limit(1))
        .getSingleOrNull();
  }

  Future<ReadHistory> getHistoryByBookId(String bookId) {
    return (select(readHistories)..where((tbl) => tbl.bookId.equals(bookId)))
        .getSingleOrNull();
  }

  Future updateReadInfo(ReadHistory history) {
    return update(readHistories).replace(history);
  }

  Future deleteReadInfo(ReadHistory history) {
    return delete(readHistories).delete(history);
  }

  Future deleteReadInfoByBookId(String bookId) {
    return (delete(readHistories)..where((tbl) => tbl.bookId.equals(bookId)))
        .go();
  }
}
