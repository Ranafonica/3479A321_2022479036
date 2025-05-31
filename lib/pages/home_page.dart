import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  String _imageUrl = 'https://picsum.photos/250?image=11';

  void _getNewImage() {
    setState(() {
      _counter++;
      _imageUrl = 'https://picsum.photos/250?image=$_counter';
    });
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
            Image.network(_imageUrl,
              width: 300,
              height: 300,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Text(
                  'Error al cargar la imagen. Verifique su conexión.',
                  style: TextStyle(color: Colors.red),
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
          ],
        ),
      ),
    );
  }
}



