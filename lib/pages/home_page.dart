import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // paquete para http
import 'package:camera/camera.dart';
import 'package:aplication_lab/screens/picture_screen.dart';

late List<CameraDescription> cameras;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  String _imageUrl = 'https://picsum.photos/250?image=11';
  CameraDescription? firstCamera;

  @override
  void initState() {
    super.initState();
    _loadCameras();
  }

  Future<void> _loadCameras() async {
    cameras = await availableCameras();
    setState(() {
      firstCamera = cameras.first;
    });
  }

  Future<void> _getNewImage() async {
    final newCounter = _counter + 1;
    final newImageUrl = 'https://picsum.photos/250?image=$newCounter';

    try {
      final response = await http.get(Uri.parse(newImageUrl));
      if (response.statusCode == 200) {
        setState(() {
          _counter = newCounter;
          _imageUrl = newImageUrl;
        });
      } else {
        setState((){
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('La imagen no está disponible.')));
        });
      }
    } catch (e) {
      setState((){
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error de conexión o URL inválida.')));
      });
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home - Imagen desde Internet'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              _imageUrl.isNotEmpty ? _imageUrl : '',
              width: 250,
              height: 250,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Text(
                    'Error tras cargar imágen',
                    style: TextStyle(color: Colors.red),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getNewImage,
              child: const Text('Obtener nueva imagen'),
            ),
            const SizedBox(height: 10),
            Text('Imagen #: $_counter'),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: firstCamera == null
                  ? null
                  : () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PictureScreen(camera: firstCamera!),
                        ),
                      );
                    },
              child: const Text('Abrir cámara'),
            ),
          ],
        ),
      ),
    );
  }
}



