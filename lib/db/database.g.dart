// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class shelf extends DataClass implements Insertable<shelf> {
  final String bookId;
  final String name;
  final int size;
  final String cover;
  final String path;
  final String encode;
  final int addTime;
  shelf(
      {@required this.bookId,
      @required this.name,
      @required this.size,
      @required this.cover,
      @required this.path,
      @required this.encode,
      @required this.addTime});
  factory shelf.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    return shelf(
      bookId:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}book_id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      size: intType.mapFromDatabaseResponse(data['${effectivePrefix}size']),
      cover:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}cover']),
      path: stringType.mapFromDatabaseResponse(data['${effectivePrefix}path']),
      encode:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}encode']),
      addTime:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}add_time']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || bookId != null) {
      map['book_id'] = Variable<String>(bookId);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || size != null) {
      map['size'] = Variable<int>(size);
    }
    if (!nullToAbsent || cover != null) {
      map['cover'] = Variable<String>(cover);
    }
    if (!nullToAbsent || path != null) {
      map['path'] = Variable<String>(path);
    }
    if (!nullToAbsent || encode != null) {
      map['encode'] = Variable<String>(encode);
    }
    if (!nullToAbsent || addTime != null) {
      map['add_time'] = Variable<int>(addTime);
    }
    return map;
  }

  BookCompanion toCompanion(bool nullToAbsent) {
    return BookCompanion(
      bookId:
          bookId == null && nullToAbsent ? const Value.absent() : Value(bookId),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      size: size == null && nullToAbsent ? const Value.absent() : Value(size),
      cover:
          cover == null && nullToAbsent ? const Value.absent() : Value(cover),
      path: path == null && nullToAbsent ? const Value.absent() : Value(path),
      encode:
          encode == null && nullToAbsent ? const Value.absent() : Value(encode),
      addTime: addTime == null && nullToAbsent
          ? const Value.absent()
          : Value(addTime),
    );
  }

  factory shelf.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return shelf(
      bookId: serializer.fromJson<String>(json['bookId']),
      name: serializer.fromJson<String>(json['name']),
      size: serializer.fromJson<int>(json['size']),
      cover: serializer.fromJson<String>(json['cover']),
      path: serializer.fromJson<String>(json['path']),
      encode: serializer.fromJson<String>(json['encode']),
      addTime: serializer.fromJson<int>(json['addTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'bookId': serializer.toJson<String>(bookId),
      'name': serializer.toJson<String>(name),
      'size': serializer.toJson<int>(size),
      'cover': serializer.toJson<String>(cover),
      'path': serializer.toJson<String>(path),
      'encode': serializer.toJson<String>(encode),
      'addTime': serializer.toJson<int>(addTime),
    };
  }

  shelf copyWith(
          {String bookId,
          String name,
          int size,
          String cover,
          String path,
          String encode,
          int addTime}) =>
      shelf(
        bookId: bookId ?? this.bookId,
        name: name ?? this.name,
        size: size ?? this.size,
        cover: cover ?? this.cover,
        path: path ?? this.path,
        encode: encode ?? this.encode,
        addTime: addTime ?? this.addTime,
      );
  @override
  String toString() {
    return (StringBuffer('shelf(')
          ..write('bookId: $bookId, ')
          ..write('name: $name, ')
          ..write('size: $size, ')
          ..write('cover: $cover, ')
          ..write('path: $path, ')
          ..write('encode: $encode, ')
          ..write('addTime: $addTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      bookId.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              size.hashCode,
              $mrjc(
                  cover.hashCode,
                  $mrjc(path.hashCode,
                      $mrjc(encode.hashCode, addTime.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is shelf &&
          other.bookId == this.bookId &&
          other.name == this.name &&
          other.size == this.size &&
          other.cover == this.cover &&
          other.path == this.path &&
          other.encode == this.encode &&
          other.addTime == this.addTime);
}

class BookCompanion extends UpdateCompanion<shelf> {
  final Value<String> bookId;
  final Value<String> name;
  final Value<int> size;
  final Value<String> cover;
  final Value<String> path;
  final Value<String> encode;
  final Value<int> addTime;
  const BookCompanion({
    this.bookId = const Value.absent(),
    this.name = const Value.absent(),
    this.size = const Value.absent(),
    this.cover = const Value.absent(),
    this.path = const Value.absent(),
    this.encode = const Value.absent(),
    this.addTime = const Value.absent(),
  });
  BookCompanion.insert({
    @required String bookId,
    @required String name,
    @required int size,
    @required String cover,
    @required String path,
    @required String encode,
    @required int addTime,
  })  : bookId = Value(bookId),
        name = Value(name),
        size = Value(size),
        cover = Value(cover),
        path = Value(path),
        encode = Value(encode),
        addTime = Value(addTime);
  static Insertable<shelf> custom({
    Expression<String> bookId,
    Expression<String> name,
    Expression<int> size,
    Expression<String> cover,
    Expression<String> path,
    Expression<String> encode,
    Expression<int> addTime,
  }) {
    return RawValuesInsertable({
      if (bookId != null) 'book_id': bookId,
      if (name != null) 'name': name,
      if (size != null) 'size': size,
      if (cover != null) 'cover': cover,
      if (path != null) 'path': path,
      if (encode != null) 'encode': encode,
      if (addTime != null) 'add_time': addTime,
    });
  }

  BookCompanion copyWith(
      {Value<String> bookId,
      Value<String> name,
      Value<int> size,
      Value<String> cover,
      Value<String> path,
      Value<String> encode,
      Value<int> addTime}) {
    return BookCompanion(
      bookId: bookId ?? this.bookId,
      name: name ?? this.name,
      size: size ?? this.size,
      cover: cover ?? this.cover,
      path: path ?? this.path,
      encode: encode ?? this.encode,
      addTime: addTime ?? this.addTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (bookId.present) {
      map['book_id'] = Variable<String>(bookId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (size.present) {
      map['size'] = Variable<int>(size.value);
    }
    if (cover.present) {
      map['cover'] = Variable<String>(cover.value);
    }
    if (path.present) {
      map['path'] = Variable<String>(path.value);
    }
    if (encode.present) {
      map['encode'] = Variable<String>(encode.value);
    }
    if (addTime.present) {
      map['add_time'] = Variable<int>(addTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BookCompanion(')
          ..write('bookId: $bookId, ')
          ..write('name: $name, ')
          ..write('size: $size, ')
          ..write('cover: $cover, ')
          ..write('path: $path, ')
          ..write('encode: $encode, ')
          ..write('addTime: $addTime')
          ..write(')'))
        .toString();
  }
}

class $BookTable extends Book with TableInfo<$BookTable, shelf> {
  final GeneratedDatabase _db;
  final String _alias;
  $BookTable(this._db, [this._alias]);
  final VerificationMeta _bookIdMeta = const VerificationMeta('bookId');
  GeneratedTextColumn _bookId;
  @override
  GeneratedTextColumn get bookId => _bookId ??= _constructBookId();
  GeneratedTextColumn _constructBookId() {
    return GeneratedTextColumn(
      'book_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _sizeMeta = const VerificationMeta('size');
  GeneratedIntColumn _size;
  @override
  GeneratedIntColumn get size => _size ??= _constructSize();
  GeneratedIntColumn _constructSize() {
    return GeneratedIntColumn(
      'size',
      $tableName,
      false,
    );
  }

  final VerificationMeta _coverMeta = const VerificationMeta('cover');
  GeneratedTextColumn _cover;
  @override
  GeneratedTextColumn get cover => _cover ??= _constructCover();
  GeneratedTextColumn _constructCover() {
    return GeneratedTextColumn(
      'cover',
      $tableName,
      false,
    );
  }

  final VerificationMeta _pathMeta = const VerificationMeta('path');
  GeneratedTextColumn _path;
  @override
  GeneratedTextColumn get path => _path ??= _constructPath();
  GeneratedTextColumn _constructPath() {
    return GeneratedTextColumn(
      'path',
      $tableName,
      false,
    );
  }

  final VerificationMeta _encodeMeta = const VerificationMeta('encode');
  GeneratedTextColumn _encode;
  @override
  GeneratedTextColumn get encode => _encode ??= _constructEncode();
  GeneratedTextColumn _constructEncode() {
    return GeneratedTextColumn(
      'encode',
      $tableName,
      false,
    );
  }

  final VerificationMeta _addTimeMeta = const VerificationMeta('addTime');
  GeneratedIntColumn _addTime;
  @override
  GeneratedIntColumn get addTime => _addTime ??= _constructAddTime();
  GeneratedIntColumn _constructAddTime() {
    return GeneratedIntColumn(
      'add_time',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [bookId, name, size, cover, path, encode, addTime];
  @override
  $BookTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'book';
  @override
  final String actualTableName = 'book';
  @override
  VerificationContext validateIntegrity(Insertable<shelf> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('book_id')) {
      context.handle(_bookIdMeta,
          bookId.isAcceptableOrUnknown(data['book_id'], _bookIdMeta));
    } else if (isInserting) {
      context.missing(_bookIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('size')) {
      context.handle(
          _sizeMeta, size.isAcceptableOrUnknown(data['size'], _sizeMeta));
    } else if (isInserting) {
      context.missing(_sizeMeta);
    }
    if (data.containsKey('cover')) {
      context.handle(
          _coverMeta, cover.isAcceptableOrUnknown(data['cover'], _coverMeta));
    } else if (isInserting) {
      context.missing(_coverMeta);
    }
    if (data.containsKey('path')) {
      context.handle(
          _pathMeta, path.isAcceptableOrUnknown(data['path'], _pathMeta));
    } else if (isInserting) {
      context.missing(_pathMeta);
    }
    if (data.containsKey('encode')) {
      context.handle(_encodeMeta,
          encode.isAcceptableOrUnknown(data['encode'], _encodeMeta));
    } else if (isInserting) {
      context.missing(_encodeMeta);
    }
    if (data.containsKey('add_time')) {
      context.handle(_addTimeMeta,
          addTime.isAcceptableOrUnknown(data['add_time'], _addTimeMeta));
    } else if (isInserting) {
      context.missing(_addTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  shelf map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return shelf.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $BookTable createAlias(String alias) {
    return $BookTable(_db, alias);
  }
}

class read_info extends DataClass implements Insertable<read_info> {
  final int id;
  final String bookId;
  final int readTime;
  final int readPosition;
  final bool lastRead;
  read_info(
      {@required this.id,
      @required this.bookId,
      @required this.readTime,
      @required this.readPosition,
      @required this.lastRead});
  factory read_info.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return read_info(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      bookId:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}book_id']),
      readTime:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}read_time']),
      readPosition: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}read_position']),
      lastRead:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}last_read']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || bookId != null) {
      map['book_id'] = Variable<String>(bookId);
    }
    if (!nullToAbsent || readTime != null) {
      map['read_time'] = Variable<int>(readTime);
    }
    if (!nullToAbsent || readPosition != null) {
      map['read_position'] = Variable<int>(readPosition);
    }
    if (!nullToAbsent || lastRead != null) {
      map['last_read'] = Variable<bool>(lastRead);
    }
    return map;
  }

  ReadInfoCompanion toCompanion(bool nullToAbsent) {
    return ReadInfoCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      bookId:
          bookId == null && nullToAbsent ? const Value.absent() : Value(bookId),
      readTime: readTime == null && nullToAbsent
          ? const Value.absent()
          : Value(readTime),
      readPosition: readPosition == null && nullToAbsent
          ? const Value.absent()
          : Value(readPosition),
      lastRead: lastRead == null && nullToAbsent
          ? const Value.absent()
          : Value(lastRead),
    );
  }

  factory read_info.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return read_info(
      id: serializer.fromJson<int>(json['id']),
      bookId: serializer.fromJson<String>(json['bookId']),
      readTime: serializer.fromJson<int>(json['readTime']),
      readPosition: serializer.fromJson<int>(json['readPosition']),
      lastRead: serializer.fromJson<bool>(json['lastRead']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'bookId': serializer.toJson<String>(bookId),
      'readTime': serializer.toJson<int>(readTime),
      'readPosition': serializer.toJson<int>(readPosition),
      'lastRead': serializer.toJson<bool>(lastRead),
    };
  }

  read_info copyWith(
          {int id,
          String bookId,
          int readTime,
          int readPosition,
          bool lastRead}) =>
      read_info(
        id: id ?? this.id,
        bookId: bookId ?? this.bookId,
        readTime: readTime ?? this.readTime,
        readPosition: readPosition ?? this.readPosition,
        lastRead: lastRead ?? this.lastRead,
      );
  @override
  String toString() {
    return (StringBuffer('read_info(')
          ..write('id: $id, ')
          ..write('bookId: $bookId, ')
          ..write('readTime: $readTime, ')
          ..write('readPosition: $readPosition, ')
          ..write('lastRead: $lastRead')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          bookId.hashCode,
          $mrjc(readTime.hashCode,
              $mrjc(readPosition.hashCode, lastRead.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is read_info &&
          other.id == this.id &&
          other.bookId == this.bookId &&
          other.readTime == this.readTime &&
          other.readPosition == this.readPosition &&
          other.lastRead == this.lastRead);
}

class ReadInfoCompanion extends UpdateCompanion<read_info> {
  final Value<int> id;
  final Value<String> bookId;
  final Value<int> readTime;
  final Value<int> readPosition;
  final Value<bool> lastRead;
  const ReadInfoCompanion({
    this.id = const Value.absent(),
    this.bookId = const Value.absent(),
    this.readTime = const Value.absent(),
    this.readPosition = const Value.absent(),
    this.lastRead = const Value.absent(),
  });
  ReadInfoCompanion.insert({
    this.id = const Value.absent(),
    @required String bookId,
    @required int readTime,
    @required int readPosition,
    @required bool lastRead,
  })  : bookId = Value(bookId),
        readTime = Value(readTime),
        readPosition = Value(readPosition),
        lastRead = Value(lastRead);
  static Insertable<read_info> custom({
    Expression<int> id,
    Expression<String> bookId,
    Expression<int> readTime,
    Expression<int> readPosition,
    Expression<bool> lastRead,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (bookId != null) 'book_id': bookId,
      if (readTime != null) 'read_time': readTime,
      if (readPosition != null) 'read_position': readPosition,
      if (lastRead != null) 'last_read': lastRead,
    });
  }

  ReadInfoCompanion copyWith(
      {Value<int> id,
      Value<String> bookId,
      Value<int> readTime,
      Value<int> readPosition,
      Value<bool> lastRead}) {
    return ReadInfoCompanion(
      id: id ?? this.id,
      bookId: bookId ?? this.bookId,
      readTime: readTime ?? this.readTime,
      readPosition: readPosition ?? this.readPosition,
      lastRead: lastRead ?? this.lastRead,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (bookId.present) {
      map['book_id'] = Variable<String>(bookId.value);
    }
    if (readTime.present) {
      map['read_time'] = Variable<int>(readTime.value);
    }
    if (readPosition.present) {
      map['read_position'] = Variable<int>(readPosition.value);
    }
    if (lastRead.present) {
      map['last_read'] = Variable<bool>(lastRead.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReadInfoCompanion(')
          ..write('id: $id, ')
          ..write('bookId: $bookId, ')
          ..write('readTime: $readTime, ')
          ..write('readPosition: $readPosition, ')
          ..write('lastRead: $lastRead')
          ..write(')'))
        .toString();
  }
}

class $ReadInfoTable extends ReadInfo
    with TableInfo<$ReadInfoTable, read_info> {
  final GeneratedDatabase _db;
  final String _alias;
  $ReadInfoTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _bookIdMeta = const VerificationMeta('bookId');
  GeneratedTextColumn _bookId;
  @override
  GeneratedTextColumn get bookId => _bookId ??= _constructBookId();
  GeneratedTextColumn _constructBookId() {
    return GeneratedTextColumn(
      'book_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _readTimeMeta = const VerificationMeta('readTime');
  GeneratedIntColumn _readTime;
  @override
  GeneratedIntColumn get readTime => _readTime ??= _constructReadTime();
  GeneratedIntColumn _constructReadTime() {
    return GeneratedIntColumn(
      'read_time',
      $tableName,
      false,
    );
  }

  final VerificationMeta _readPositionMeta =
      const VerificationMeta('readPosition');
  GeneratedIntColumn _readPosition;
  @override
  GeneratedIntColumn get readPosition =>
      _readPosition ??= _constructReadPosition();
  GeneratedIntColumn _constructReadPosition() {
    return GeneratedIntColumn(
      'read_position',
      $tableName,
      false,
    );
  }

  final VerificationMeta _lastReadMeta = const VerificationMeta('lastRead');
  GeneratedBoolColumn _lastRead;
  @override
  GeneratedBoolColumn get lastRead => _lastRead ??= _constructLastRead();
  GeneratedBoolColumn _constructLastRead() {
    return GeneratedBoolColumn(
      'last_read',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, bookId, readTime, readPosition, lastRead];
  @override
  $ReadInfoTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'read_info';
  @override
  final String actualTableName = 'read_info';
  @override
  VerificationContext validateIntegrity(Insertable<read_info> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('book_id')) {
      context.handle(_bookIdMeta,
          bookId.isAcceptableOrUnknown(data['book_id'], _bookIdMeta));
    } else if (isInserting) {
      context.missing(_bookIdMeta);
    }
    if (data.containsKey('read_time')) {
      context.handle(_readTimeMeta,
          readTime.isAcceptableOrUnknown(data['read_time'], _readTimeMeta));
    } else if (isInserting) {
      context.missing(_readTimeMeta);
    }
    if (data.containsKey('read_position')) {
      context.handle(
          _readPositionMeta,
          readPosition.isAcceptableOrUnknown(
              data['read_position'], _readPositionMeta));
    } else if (isInserting) {
      context.missing(_readPositionMeta);
    }
    if (data.containsKey('last_read')) {
      context.handle(_lastReadMeta,
          lastRead.isAcceptableOrUnknown(data['last_read'], _lastReadMeta));
    } else if (isInserting) {
      context.missing(_lastReadMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  read_info map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return read_info.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ReadInfoTable createAlias(String alias) {
    return $ReadInfoTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $BookTable _book;
  $BookTable get book => _book ??= $BookTable(this);
  $ReadInfoTable _readInfo;
  $ReadInfoTable get readInfo => _readInfo ??= $ReadInfoTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [book, readInfo];
}
