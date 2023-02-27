import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class PathController {
  static String path = "";

  static Future<String> getPath() async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      var dir = await getApplicationDocumentsDirectory();
      print(dir.path);
      return "${dir.path}/appfiles";
    } else {
      var dir = await getApplicationDocumentsDirectory();

      return "${dir.path}/appfiles";
    }
  }
}
