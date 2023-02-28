import 'dart:io';

import 'package:path_provider/path_provider.dart';

class PathController {
  static String currentPath = "";

  static List<FileSystemEntity> folders = <FileSystemEntity>[];
  static List<String> folderNames = [];

  static String clickedFolderPath = "";
  static Future<void> getDir(String path) async {
    final directory = await getExternalStorageDirectory();
    final dir = "${directory!.path}/$path";
    String pdfDirectory = '$dir/';
    final myDir = Directory(pdfDirectory);
    folders = myDir.listSync(recursive: true, followLinks: false);
    for (FileSystemEntity fileOrDirectory in folders) {
      if (fileOrDirectory is Directory) {
        folderNames.add(fileOrDirectory.path.split('/').last);
      }
    }
  }

  static String getStringName() {
    return clickedFolderPath;
  }
}
