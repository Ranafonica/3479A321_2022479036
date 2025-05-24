import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({super.key});

  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  late TextEditingController _nameController;
  bool _allowReset = true;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _nameController.text = prefs.getString('userName') ?? '';
      _allowReset = prefs.getBool('allowReset') ?? true;
    });
  }

  Future<void> _savePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', _nameController.text);
    await prefs.setBool('allowReset', _allowReset);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Preferencias guardadas')),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Preferencias')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text('Nombre de usuario'),
            TextField(controller: _nameController),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text('Permitir Reset'),
                Switch(
                  value: _allowReset,
                  onChanged: (value) {
                    setState(() {
                      _allowReset = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _savePreferences,
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
