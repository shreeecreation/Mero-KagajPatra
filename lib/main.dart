import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kagajpatra/firebase_options.dart';
import 'package:kagajpatra/src/core/routes/routes.dart';
import 'src/app/screens/homescreen/landingscreen/presentation/bloc/folderbloc_bloc.dart';
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
    FolderCreateInitial.createFolderUser();
    FolderCreateInitial.createFolderImg();
    FolderCreateInitial.createDefaultFolder();

    return GestureDetector(
      onTap: () {
        SystemChannels.textInput.invokeMethod('TextInput.hide');
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider<FolderBloc>(
            create: (BuildContext context) => FolderBloc(),
          )
        ],
        child: MaterialApp(
            theme: ThemeData(primarySwatch: Colors.blue, brightness: Brightness.light, fontFamily: "lato"),
            debugShowCheckedModeBanner: false,
            initialRoute: "/",
            onGenerateRoute: Routes.generateRoute),
      ),
    );
  }
}
