import 'package:flutter/material.dart';

class DefaultFolderScreen extends StatelessWidget {
  final String folderName;
  const DefaultFolderScreen({super.key, required this.folderName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DefaultFolder/$folderName")),

      
    );
  }
}
