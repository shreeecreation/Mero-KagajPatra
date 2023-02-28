import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kagajpatra/src/core/themes/appstyles.dart';
import 'package:path_provider/path_provider.dart';

abstract class UserFolderCreate {
  static void createFolder(String filename, context) async {
    if (filename == "") {
    } else {
      try {
        final Directory? appDocDir = await getExternalStorageDirectory();
        final Directory appDocDirFolder = Directory('${appDocDir!.path}/appfiles/user/$filename');
        if (await appDocDirFolder.exists()) {
          Navigator.pop(context);

          UserFolderCreateDialog.repeatedName(context);
        } else {
          //if folder not exists create folder and then return its path
          final Directory appDocDirNewFolder = await appDocDirFolder.create(recursive: true);
          Navigator.pop(context);

          UserFolderCreateDialog.successCreated(context);
        }
      } catch (e) {
        print("hudai xa ");
      }
    }
  }
}

class UserFolderCreateDialog extends Dialog {
  const UserFolderCreateDialog({super.key});
  static TextEditingController controller = TextEditingController();
  static final formKey = GlobalKey<FormState>();

  static Future<void> createFolder(BuildContext context) async {
    showGeneralDialog(
        barrierDismissible: false,
        transitionBuilder: (context, a1, a2, widget) {
          final curvedValue = Curves.easeIn.transform(a1.value) - 1.0;
          return Transform(
            transform: Matrix4.translationValues(1, curvedValue * 200, 0.0),
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                shape: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
                title: Row(
                  children: [
                    Text(
                      'Create Folder',
                      style: AppStyles.text29PxMedium,
                    ),
                    const SizedBox(width: 20),
                    const Icon(Icons.create_new_folder_rounded, size: 35),
                  ],
                ),
                content: SizedBox(
                  height: 200,
                  width: MediaQuery.of(context).size.width - 20,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Form(
                        key: formKey,
                        child: TextFormField(
                          onChanged: (value) {},
                          controller: controller,
                          decoration: InputDecoration(
                            labelText: "folder name",
                            fillColor: Colors.white,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: const BorderSide()),
                          ),
                          validator: (val) {
                            if (val == "") {
                              return "folder name cannot be empty !";
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: 40,
                            width: 100,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(elevation: 0, backgroundColor: Colors.blue[300]),
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    UserFolderCreate.createFolder(controller.text, context);
                                  }
                                },
                                child: const Text("CREATE")),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 200),
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {
          return const Text("dasdas");
        });
  }

  static Future<void> successCreated(BuildContext context) async {
    showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
          return Transform(
            transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                shape: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
                title: Column(
                  children: [
                    const Text(' Folder Created !\n'),
                    // const SizedBox(height: ),
                    const Icon(Icons.check_circle_sharp, size: 30, color: Colors.green),
                    const SizedBox(height: 10),
                    Text('"${controller.text}"'),
                  ],
                ),
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(elevation: 0, backgroundColor: Colors.green),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        child: const Text("Ok")),
                  ],
                ),
              ),
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {
          return const Text("dasdas");
        });
  }

  static Future<void> repeatedName(BuildContext context) async {
    showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
          return Transform(
            transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                shape: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
                title: Column(
                  children: [const Text("Already Exists ?\n"), Text('"${controller.text}"')],
                ),
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(elevation: 0, backgroundColor: Colors.red),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        child: const Text("Ok")),
                  ],
                ),
              ),
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {
          return const Text("dasdas");
        });
  }
}
