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
    //logger.i('createState llamado');    //logger quitado para evitar warnings
    return _MyHomePageState();
  }
  //State<MyHomePage> createState() => _MyHomePageState();
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
  //logger.i('initState');    //logger quitado para evitar warnings
}
@override
void didChangeDependencies() {
  super.didChangeDependencies();
  //logger.i('didChangeDependencies');    //logger quitado para evitar warnings
}

@override
void didUpdateWidget(covariant MyHomePage oldWidget) {
  super.didUpdateWidget(oldWidget);
  //logger.i('didUpdateWidget');    //logger quitado para evitar warnings
}

@override
void deactivate() {
  super.deactivate();
  //logger.i('deactivate');   //logger quitado para evitar warnings
}

@override
void dispose() {
  super.dispose();
  //logger.i('dispose');    //logger quitado para evitar warnings
}

@override
void reassemble() {
  super.reassemble();
  //logger.i('reassemble (hot reload)');    //logger quitado para evitar warnings
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
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Menú', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              title: const Text('Inicio'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
            ListTile(
              title: const Text('Lista'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/list');
              },
            ),
            ListTile(
              title: const Text('Sobre'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/about');
              },
            ),
          ],
        ),
      ),
    );
  }
}