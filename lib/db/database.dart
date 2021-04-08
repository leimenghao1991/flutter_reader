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
}

@DataClassName("ReadHistory")
class ReadHistories extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get bookId => text()();

  IntColumn get readTime => integer()();

  IntColumn get readPosition => integer()();

  BoolColumn get lastRead => boolean()();
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

  Future insertBook(BookInfo book) {
    return into(bookInfos).insert(book.toCompanion(false));
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

  Future insertReadInfo(ReadHistory history) {
    return into(readHistories).insert(history.toCompanion(false));
  }

  Future<List<ReadHistory>> getAllReadInfos() {
    return select(readHistories).get();
  }

  Future updateReadInfo(ReadHistory history) {
    return update(readHistories).replace(history);
  }

  Future deleteReadInfo(ReadHistory history) {
    return delete(readHistories).delete(history);
  }
}
