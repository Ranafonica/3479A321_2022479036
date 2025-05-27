import 'package:flutter/material.dart';
import '../models/actividad.dart';
import '../db/database_helper.dart';

class ActividadesScreen extends StatefulWidget {
  @override
  _ActividadesScreenState createState() => _ActividadesScreenState();
}

class _ActividadesScreenState extends State<ActividadesScreen> {
  List<Actividad> _actividades = [];
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _cargarActividades();
  }

  void _cargarActividades() async {
    List<Actividad> actividades = await DatabaseHelper().getActivities();
    setState(() {
      _actividades = actividades;
    });
  }

  void _guardarActividad() async {
    String nombre = _nombreController.text;
    String descripcion = _descripcionController.text;

    if (nombre.isNotEmpty && descripcion.isNotEmpty) {
      Actividad nuevaActividad = Actividad(
        nombre: nombre,
        descripcion: descripcion,
      );

      await DatabaseHelper().insertActivity(nuevaActividad);
      _nombreController.clear();
      _descripcionController.clear();
      Navigator.of(context).pop();
      _cargarActividades();
    }
  }

  void _mostrarDialogoAgregarActividad() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Nueva Actividad"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nombreController,
                decoration: InputDecoration(labelText: 'Nombre'),
              ),
              TextField(
                controller: _descripcionController,
                decoration: InputDecoration(labelText: 'Descripción'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                _guardarActividad();
              },
              child: Text('Guardar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Actividades'),
      ),
      body: _actividades.isEmpty
          ? Center(child: Text('No hay actividades registradas.'))
          : ListView.builder(
              itemCount: _actividades.length,
              itemBuilder: (context, index) {
                final actividad = _actividades[index];
                return ListTile(
                  title: Text(actividad.nombre),
                  subtitle: Text(actividad.descripcion),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _mostrarDialogoAgregarActividad,
        child: Icon(Icons.add),
      ),
    );
  }
}
