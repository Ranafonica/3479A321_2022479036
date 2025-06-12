import 'dart:io';
import 'package:flutter/material.dart';

class PreviewPictureScreen extends StatelessWidget {
  final String imagePath;

  const PreviewPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vista previa')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.file(
            File(imagePath),
            width: 300,
            height: 300,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, imagePath);
            },
            child: const Text('Usar esta imagen'),
          ),
        ],
      ),
    );
  }
}
