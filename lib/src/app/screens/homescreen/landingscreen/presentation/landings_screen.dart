import 'dart:async';
import 'dart:io';
import 'package:file_manager/file_manager.dart';
import 'package:flutter/material.dart';
import 'package:kagajpatra/src/app/screens/auth/login/domain/login_auth.dart';
import 'package:kagajpatra/src/app/screens/homescreen/landingscreen/domain/landingscreen_domain.dart';
import 'package:kagajpatra/src/core/themes/appstyles.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  bool isLoading = false;
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      setState(() {
        isLoading = true;
      });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String a;
    FileManagerController controller = FileManagerController();

    void getPath() async {
      a = await PathController.getPath();
      controller.setCurrentPath = a;
    }

    getPath(); // TODO implements the path of directory

    return ControlBackButton(
      controller: controller,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0.2,
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
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
              child: Column(children: [
                Text("Default Folder ", style: AppStyles.text20PxSemiBold),
                FileManager(
                  controller: controller,
                  builder: (context, snapshot) {
                    isLoading ? null : getPath(); // TODO implements the path of directory
                    final List<FileSystemEntity> entities = snapshot;
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: entities.length,
                      itemBuilder: (context, index) {
                        FileSystemEntity entity = entities[index];
                        return Card(
                          child: ListTile(
                            leading: FileManager.isFile(entity) ? const Icon(Icons.feed_outlined) : const Icon(Icons.folder),
                            title: Text(FileManager.basename(entity)),
                            subtitle: subtitle(entity),
                            onTap: () async {
                              if (FileManager.isDirectory(entity)) {
                                controller.openDirectory(entity);
                              } else {}
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
                const SizedBox(height: 10),
                Text("User Added Folder ", style: AppStyles.text20PxSemiBold),
              ]),
            ),
          )),
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
