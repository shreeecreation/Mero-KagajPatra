import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FolderCreateInitial {
  static Future<String> createFolderImg() async {
    // /Get this App Document Directory
    final Directory? appDocDir = await getExternalStorageDirectory();
    //App Document Directory + folder name
    final Directory appDocDirFolder = Directory('${appDocDir!.path}/appfiles/img');
    if (await appDocDirFolder.exists()) {
      //if folder already exists return path
      return appDocDirFolder.path;
    } else {
      //if folder not exists create folder and then return its path
      final Directory appDocDirNewFolder = await appDocDirFolder.create(recursive: true);
      return appDocDirNewFolder.path;
    }
  }

  static Future<String> createFolderUser() async {
    // /Get this App Document Directory
    final Directory? appDocDir = await getExternalStorageDirectory();
    //App Document Directory + folder name
    final Directory appDocDirFolder = Directory('${appDocDir!.path}/appfiles/user');
    if (await appDocDirFolder.exists()) {
      //if folder already exists return path
      return appDocDirFolder.path;
    } else {
      //if folder not exists create folder and then return its path
      final Directory appDocDirNewFolder = await appDocDirFolder.create(recursive: true);
      return appDocDirNewFolder.path;
    }
  }

  static createDefaultFolder() async {
    //List of default folders
    List<String> defaultFolder = ["SLC", "Passport", "Nagarikta", "Birth Certificate", "+2 Certificate"];
    // /Get this App Document Directory
    final Directory? appDocDir = await getExternalStorageDirectory();
    helperFunction(appDocDir, defaultFolder[0]);
    helperFunction(appDocDir, defaultFolder[1]);
    helperFunction(appDocDir, defaultFolder[2]);
    helperFunction(appDocDir, defaultFolder[3]);
    helperFunction(appDocDir, defaultFolder[4]);
    //App Document Directory + folder name
  }

  static helperFunction(appDocDir, defaultFolder) async {
    final Directory appDocDirFolder = Directory('${appDocDir.path}/appfiles/img/$defaultFolder');
    if (await appDocDirFolder.exists()) {
      //if folder already exists return path
      return appDocDirFolder.path;
    } else {
      //if folder not exists create folder and then return its path
      final Directory appDocDirNewFolder = await appDocDirFolder.create(recursive: true);
      return appDocDirNewFolder.path;
    }
  }
}
