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
        itemCount: items.length + 1,
        itemBuilder: (context, index) {
          if (index == items.length) {
            return Column(
              children: [
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/about');
                  },
                  child: const Text('Ir a About'),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Volver'),
                ),
                const SizedBox(height: 16),
              ],
            );
          }
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
