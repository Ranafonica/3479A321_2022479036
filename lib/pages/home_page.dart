import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
//import 'package:provider/provider.dart';
//import 'package:aplication_lab/provider/app_data.dart';
//import 'package:flutter_svg/svg.dart'; 

var logger = Logger(
  printer: PrettyPrinter(),
);

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  // ignore: no_logic_in_create_state
  State<MyHomePage> createState() {
    logger.i('createState llamado');
    return _MyHomePageState();
  }
  //State<MyHomePage> createState() => _MyHomePageState(); //comentado por Warnings de createState
}

class _MyHomePageState extends State<MyHomePage> {
  /*void _navigateByCounter() {
  if (_counter % 2 == 0) {
    Navigator.pushNamed(context, '/list');
  } else {
    Navigator.pushNamed(context, '/about');
  }
}*/

@override
void initState() {
  super.initState();
  logger.i('initState');
}
@override
void didChangeDependencies() {
  super.didChangeDependencies();
  logger.i('didChangeDependencies');
}

@override
void didUpdateWidget(covariant MyHomePage oldWidget) {
  super.didUpdateWidget(oldWidget);
  logger.i('didUpdateWidget');
}

@override
void deactivate() {
  super.deactivate();
  logger.i('deactivate');
}

@override
void dispose() {
  super.dispose();
  logger.i('dispose');
}

@override
void reassemble() {
  super.reassemble();
  logger.i('reassemble (hot reload)');
}

@override
Widget build(BuildContext context) {
  logger.i('build');
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menú de navegacion'),
            ),
            ListTile(
              title: const Text('Inicio'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Lista de elementos'),
              onTap: () {
                Navigator.pushNamed(context, '/list');
              },
            ),
            ListTile(
              title: const Text('About'),
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
          ],
        ),
      ),
    );
  }
}
