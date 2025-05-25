import 'package:flutter/material.dart';
import 'package:aplication_lab/pages/home_page.dart';
import 'list_content.dart';
import 'about.dart';
import 'preferences_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Mi Aplicación'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Inicio'),
              Tab(icon: Icon(Icons.list), text: 'Lista'),
              Tab(icon: Icon(Icons.info), text: 'Sobre'),
              Tab(icon: Icon(Icons.settings), text: 'Preferencias'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const MyHomePage(title: 'Inicio'),
            ListContent(),
            const About(),
            const PreferencesScreen(),
          ],
        ),
      ),
    );
  }
}
