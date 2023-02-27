import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kagajpatra/firebase_options.dart';
import 'package:kagajpatra/src/core/routes/routes.dart';

import 'src/core/folderCreationInitial/foldercreationinitial.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    FolderCreateInitial.createFolder();
    FolderCreateInitial.createDefaultFolder();

    return GestureDetector(
      onTap: () {
        SystemChannels.textInput.invokeMethod('TextInput.hide');
      },
      child: GetMaterialApp(
          theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "lato"),
          debugShowCheckedModeBanner: false,
          initialRoute: "/",
          onGenerateRoute: Routes.generateRoute),
    );
  }
}
