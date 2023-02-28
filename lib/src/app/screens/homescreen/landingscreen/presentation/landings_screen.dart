import 'dart:io';
import 'package:file_manager/file_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kagajpatra/src/app/screens/auth/login/domain/login_auth.dart';
import 'package:kagajpatra/src/app/screens/homescreen/landingscreen/domain/landingscreen_domain.dart';
import 'package:kagajpatra/src/core/themes/appstyles.dart';
import 'package:kagajpatra/src/core/userfoldercreate/userfoldercreate.dart';

import 'bloc/folderbloc_bloc.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
            onPressed: () {
              UserFolderCreateDialog.createFolder(context);
            },
            child: const Icon(Icons.add)),
      ),
      appBar: AppBar(
        elevation: 0.5,
        title: const Text("Mero KagajPatra"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: <Color>[Colors.blue, Colors.purple]),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                LoginAuth.logOutUser();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: const Text("Dasdsd"),
    );
  }
}

class DefaultFolder extends StatelessWidget {
  const DefaultFolder({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: GridView.builder(
          shrinkWrap: true,
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(mainAxisSpacing: 5, crossAxisSpacing: 5, crossAxisCount: 3, childAspectRatio: 1),
          itemCount: PathController.folders.length,
          itemBuilder: (BuildContext ctx, index) {
            return Column(
              children: [
                GestureDetector(
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) {
                      //   return DefaultFolderScreen(folderName: PathController.clickedFolderPath);
                      // }));
                      context.read<FolderBloc>().add(FolderChangeFolderEvent());
                      PathController.getDir("/appfiles/img/${PathController.folderNames[index]}");
                      PathController.clickedFolderPath = PathController.folderNames[index];
                    },
                    child: const Icon(Icons.folder, size: 90, color: Color.fromARGB(255, 243, 190, 33))),
                Text(PathController.folderNames[index], style: AppStyles.text16PxMedium),
              ],
            );
          }),
    );
  }
}

Widget subtitle(FileSystemEntity entity) {
  return FutureBuilder<FileStat>(
    future: entity.stat(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        if (entity is File) {
          int size = snapshot.data!.size;

          return Text(
            FileManager.formatBytes(size),
          );
        }
        return Text(
          "${snapshot.data!.modified}".substring(0, 10),
        );
      } else {
        return const Text("");
      }
    },
  );
}
