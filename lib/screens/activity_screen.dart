import 'package:flutter/material.dart';
import '../models/actividad.dart';
import '../services/database_helper.dart';

class ActivityScreen extends StatefulWidget { 
  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> { 
  List<Actividad> _activities = [];

  @override
  void initState() {
    super.initState();
    _loadActivities();
  }

  void _loadActivities() async {
    List<Actividad> activities = await DatabaseHelper().getActivities();
    setState(() {
      _activities = activities;
    });
  }
  
  void _showActivityDialog({Actividad? existingActivity}) {
    final TextEditingController nameCtrl = TextEditingController(text: existingActivity?.nombre ?? '');
    final TextEditingController descCtrl = TextEditingController(text: existingActivity?.descripcion ?? '');

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(existingActivity == null ? 'Nueva Actividad' : 'Editar Actividad'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameCtrl,
                decoration: InputDecoration(labelText: 'Nombre'),
              ),
              TextField(
                controller: descCtrl,
                decoration: InputDecoration(labelText: 'Descripcion'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () async {
                final name = nameCtrl.text;
                final desc = descCtrl.text;
                if (name.isNotEmpty && desc.isNotEmpty) {
                  final newActivity = Actividad(
                    id: existingActivity?.id,
                    nombre: name,
                    descripcion: desc,
                  );
                  if (existingActivity == null) {
                    await DatabaseHelper().insertActivity(newActivity);
                  } else {
                    await DatabaseHelper().updateActivity(newActivity);
                  }
                  Navigator.of(context).pop();
                  _loadActivities();
                }
              },
              child: Text('Guardar'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }

  void _deleteActivity(int id) async {
    await DatabaseHelper().deleteActivity(id);
    _loadActivities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Actividades'),
      ),
      body: _activities.isEmpty
          ? Center(child: Text('No actividades encontradas.'))
          : ListView.builder(
              itemCount: _activities.length,
              itemBuilder: (context, index) {
                final activity = _activities[index];
                return ListTile(
                  title: Text(activity.nombre),
                  subtitle: Text(activity.descripcion),
                  trailing: PopupMenuButton<String>(
                    onSelected: (String choice) {
                      if (choice == 'Editar') {
                        _showActivityDialog(existingActivity: activity);
                      } else if (choice == 'Eliminar') {
                        _deleteActivity(activity.id!);
                      }
                    },
                    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                      const PopupMenuItem<String>(
                        value: 'Editar',
                        child: Text('Edtar'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'Eliminar',
                        child: Text('Eliminar'),
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showActivityDialog(),
        child: Icon(Icons.add),
      ),
    );
  }
}

