import 'package:flutter/material.dart';

class ListContent extends StatelessWidget {
  ListContent({super.key});

  final List<String> items = [
  'Elemento 1',
  'Elemento 2',
  'Elemento 3',
  'Elemento 4',
  'Elemento 5',
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Contenido'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(items[index]),
            ),
          );
        },
      ),
    );
  }
}
