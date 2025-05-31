import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            Image.network('https://picsum.photos/250?image=11',
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
            const Text('Imagen obtenida desde internet'),
          ],
        ),
      ),
    );
  }
}



