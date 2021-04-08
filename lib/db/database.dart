import 'dart:io';

import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

@DataClassName("shelf")
class Book extends Table {
  TextColumn get bookId => text()();

  TextColumn get name => text()();

  IntColumn get size => integer()();

  TextColumn get cover => text()();

  TextColumn get path => text()();

  TextColumn get encode => text()();

  IntColumn get addTime => integer()();
}

@DataClassName("read_info")
class ReadInfo extends Table {
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

@UseMoor(tables: [Book, ReadInfo])
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}
