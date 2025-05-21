import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
//import 'package:flutter_svg/svg.dart'; 

var logger = Logger(); // Declaracion del log para poder usarlo

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() {
  logger.i('createState llamado');
  return _MyHomePageState();
}
  //State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }
  void _resetCounter() {
    setState(() {
      _counter=0;
    });
  }
  /*void _navigateByCounter() {
  if (_counter % 2 == 0) {
    Navigator.pushNamed(context, '/list');
  } else {
    Navigator.pushNamed(context, '/about');
  }
}*/

@override
void initState() {
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
                      'Contador: $_counter',
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: _incrementCounter,
                          child: const Text('+'),
                        ),
                        ElevatedButton(
                          onPressed: _decrementCounter,
                          child: const Text('-'),
                        ),
                        ElevatedButton(
                          onPressed: _resetCounter,
                          child: const Text('Reset'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/list');
                      },
                      child: const Text('Ir a Lista'),
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
