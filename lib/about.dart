/*import 'package:flutter/material.dart';
import 'provider/app_data.dart';
import 'package:provider/provider.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    final appData = Provider.of<AppData>(context);

    final nameController = TextEditingController(text: appData.userName);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre la App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Editar nombre de usuario:'),
            TextField(
              controller: nameController,
              onSubmitted: (value) {
                appData.setUserName(value);
              },
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text('Permitir botón Reset:'),
                Switch(
                  value: appData.allowReset,
                  onChanged: (value) {
                    appData.setAllowReset(value);
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Volver'),
            ),
          ],
        ),
      ),
    );
  }

}*/
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Sobre la aplicación',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
