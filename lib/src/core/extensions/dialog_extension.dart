import 'package:flutter/material.dart';

extension DialogExtension on Dialog {
  static Future<void> showAlertDialog(BuildContext context) async {
    showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
          // Color? primaryColor = context.watch<ThemeProvider>().themecolor;
          return Transform(
            transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                backgroundColor: Colors.white,
                shape: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
                title: const Text('Record Added Successfully'),
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(elevation: 0, backgroundColor: Colors.black12),
                        onPressed: () async {
                          Navigator.pop(context);
                          await Future.delayed(const Duration(milliseconds: 500));
                          Navigator.pushReplacementNamed(context, "landing");

                          // gets.Get.offAll(() => HomePage(), transition: gets.Transition.downToUp);
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
