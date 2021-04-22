import 'package:file_picker/file_picker.dart';
import 'package:flutter_reader/bean/book.dart';
import 'package:path/path.dart';

const fileExtension = const ["txt", "text"];

Future<Book> selectFile() {
  return FilePicker.platform
      .pickFiles(type: FileType.custom, allowedExtensions: fileExtension)
      .then((result) {
    if (result == null || result.files.isEmpty) {
      return Book.invalid();
    } else {
      PlatformFile file = result.files.single;
      String extension = file.extension;
      if (!fileExtension.contains(extension)) {
        return Book.invalid();
      }
      return Book(
          bookId: file.path,
          name: basenameWithoutExtension(file.name),
          size: file.size,
          cover: "default",
          path: file.path,
          encode: "utf-8",
          addTime: DateTime.now().millisecondsSinceEpoch);
    }
  });
}
