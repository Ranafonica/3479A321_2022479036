import 'package:flutter/material.dart';
import '../db/database_helper.dart';
import '../models/actividad.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  List<Actividad> _actividades = [];

  @override
  void initState() {
    super.initState();
    _loadActividades();
  }

  Future<void> _loadActividades() async {
    final data = await DatabaseHelper.instance.getActividades();
    setState(() {
      _actividades = data;
    });
  }

  Future<void> _addActividad() async {
    final nombreController = TextEditingController();
    final descripcionController = TextEditingController();

    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Nueva Actividad'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nombreController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: descripcionController,
              decoration: const InputDecoration(labelText: 'Descripción'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () async {
              final nueva = Actividad(
                nombre: nombreController.text.trim(),
                descripcion: descripcionController.text.trim(),
              );
              if (nueva.nombre.isNotEmpty && nueva.descripcion.isNotEmpty) {
                await DatabaseHelper.instance.insertActividad(nueva);
                Navigator.pop(context);
                _loadActividades(); // recarga la lista
              }
            },
            child: const Text('Guardar'),
          ),
        ],
      ),
    );
  }

  Future<void> _deleteActividad(int id) async {
    await DatabaseHelper.instance.deleteActividad(id);
    _loadActividades();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Actividades')),
      body: ListView.builder(
        itemCount: _actividades.length,
        itemBuilder: (_, index) {
          final act = _actividades[index];
          return ListTile(
            title: Text(act.nombre),
            subtitle: Text(act.descripcion),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => _deleteActividad(act.id!),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addActividad,
        child: const Icon(Icons.add),
      ),
    );
  }
}
