import 'package:flutter/material.dart';
import '../models/actividad.dart';
import '../services/database_helper.dart';

class ActivityScreen extends StatefulWidget {
  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  List <Activity> _activities = [];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadActivities();
  }

    void _loadActivities() async {
    List<Activity> activities = await DatabaseHelper().getActivities();
    setState(() {
      _activities = activities;
    });
  }
  
  void _saveActivity() async {
    String name = _nameController.text;
    String description = _descriptionController.text;

    if (name.isNotEmpty && description.isNotEmpty) {
      Activity newActivity = Activity(
        name: name,
        description: description,
        date: DateTime.now().toString(),
      );

      await DatabaseHelper().insertActivity(newActivity);
      _nameController.clear();
      _descriptionController.clear();
      Navigator.of(context).pop();
      _loadActivities();
    }
  }

  void _showAddActivityDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("New Activity"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                _saveActivity();
              },
              child: Text('Save'),
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
        title: Text('Activities'),
      ),
      body: _activities.isEmpty
          ? Center(child: Text('No activities found.'))
          : ListView.builder(
              itemCount: _activities.length,
              itemBuilder: (context, index) {
                final activity = _activities[index];
                return ListTile(
                  title: Text(activity.name),
                  subtitle: Text(activity.description),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddActivityDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}
