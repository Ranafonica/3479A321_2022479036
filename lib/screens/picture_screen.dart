import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:aplication_lab/screens/preview_picture_screen.dart';

class PictureScreen extends StatefulWidget {
  final CameraDescription camera;

  const PictureScreen({super.key, required this.camera});

  @override
  State<PictureScreen> createState() => _PictureScreenState();
}

class _PictureScreenState extends State<PictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
         onPressed: () async { 
          try { 
            await _initializeControllerFuture; 
            final image = await _controller.takePicture();

            if (!context.mounted) return; 

            await Navigator.of(context).push( 
              MaterialPageRoute( 
                builder: (context) => PreviewPictureScreen( 
                  imagePath: image.path, 
                ), 
              ), 
            );
          } catch (e) { 
            print(e); 
          } 
        } 
      ),
      appBar: AppBar(title: const Text('Vista previa de la cámara')),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
