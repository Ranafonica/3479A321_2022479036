import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:aplication_lab/provider/app_data.dart';
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
      appBar: AppBar(
        title: const Text('Contador Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Center(
            child: Card(
              elevation: 8,
              margin: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Flutter es un SDK de UI de código abierto creado por Google.',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Hola, ${context.watch<AppData>().userName}',
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () => context.read<AppData>().incrementCounter(),
                          child: const Text('+'),
                        ),
                        ElevatedButton(
                          onPressed: () => context.read<AppData>().decrementCounter(),
                          child: const Text('-'),
                        ),
                        ElevatedButton(
                          onPressed: context.watch<AppData>().allowReset
                              ? () => context.read<AppData>().resetCounter()
                              : null,
                          child: const Text('Reset'),
                        ), // Esto hace que el botón quede deshabilitado automáticamente si allowReset es false.
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/about');
                      },
                      child: const Text('Ir a About'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
